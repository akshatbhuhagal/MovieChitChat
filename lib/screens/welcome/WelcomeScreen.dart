import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:moviechitchat/models/Movie.dart';
import 'package:moviechitchat/screens/welcome/welcomewidgets/WelcomeBackground.dart';
import 'package:moviechitchat/screens/welcome/welcomewidgets/WelcomeButtons.dart';
import 'package:moviechitchat/screens/welcome/welcomewidgets/WelcomeResponsive.dart';
import 'package:moviechitchat/screens/welcome/welcomewidgets/WelcomeWidget.dart';
import 'package:moviechitchat/viewmodels/MovieListViewModel.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/MessageListViewModel.dart';
import '../chatlist/ChatListScreen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  double value = 0;

  @override
  void initState() {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    Timer(const Duration(seconds: 2), (){
      checkCurrentUser(context);
    });

    super.initState();
  }



  Future<void> checkCurrentUser(BuildContext context) async {
    try {
      AuthUser awsUser = await Amplify.Auth.getCurrentUser();
      navigationToChatScreen(awsUser.userId, awsUser.username, context);
      FlutterNativeSplash.remove();
      setState(() {
        value = 1;
      });
    } on AuthException catch (e) {
      setState(() {
        value = 1;
      });
      FlutterNativeSplash.remove();
    }
  }


  Future<void> navigationToChatScreen(String userId, String username, BuildContext context) async {
    var movieViewModel = Provider.of<MovieListViewModel>(context, listen: false);
    var messageViewModel = Provider.of<MessageListViewModel>(context, listen: false);

    Stream<QuerySnapshot<Movie>> movies = movieViewModel.observeMovies();

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (BuildContext context) {
        return  ChangeNotifierProvider(
          create: (_) => MessageListViewModel(),
          child: ChatListScreen(userId, movies, messageViewModel, username),
        );
      },
    ), (Route<dynamic> route) => false);
  }


  @override
  Widget build(BuildContext context) {

    return WelcomeBackground(
      child: SingleChildScrollView(
        child: SafeArea(
          child: value == 0 ?
          const Center(
            child: CircularProgressIndicator(),
          )
          :
          Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: WelcomeImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: LoginAndSignupBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const WelcomeImage(),
                Row(
                  children: const [
                    Spacer(),
                    Expanded(
                      flex: 8,
                      child: LoginAndSignupBtn(),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
