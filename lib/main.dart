import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviechitchat/screens/welcome/WelcomeScreen.dart';
import 'package:moviechitchat/viewmodels/MessageListViewModel.dart';
import 'package:moviechitchat/viewmodels/MovieListViewModel.dart';
import 'package:provider/provider.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future hideStatusBar() => SystemChrome.setEnabledSystemUIOverlays([]);

  @override
  initState() {
    hideStatusBar();
    super.initState();
    if(!Amplify.isConfigured) {
      _configureAmplify();
      setState(() {});
      return;
    }
  }


  void _configureAmplify() async {
    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    AmplifyDataStore datastorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugins([authPlugin, datastorePlugin, AmplifyAPI()]);

    try {
      await Amplify.configure(amplifyconfig);
      debugPrint("Amplify Configured : >>>>>>>>>>>>>> ${Amplify.isConfigured.toString()}");
    } on AmplifyAlreadyConfiguredException {
      debugPrint("Tried to reconfigure Amplify; this can occur when app restarts on Android.");
    }
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'MovieChitChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans',
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => MovieListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => MessageListViewModel(),
        ),
      ],
        child: const WelcomeScreen(),
      ),
    );
  }



}


