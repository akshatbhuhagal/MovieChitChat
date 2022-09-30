import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviechitchat/models/Message.dart';
import 'package:moviechitchat/models/Movie.dart';
import 'package:moviechitchat/screens/chatroom/ChatScreen.dart';
import 'package:moviechitchat/screens/setting/SettingScreen.dart';
import 'package:moviechitchat/screens/welcome/LoginScreen.dart';
import 'package:moviechitchat/utils/CommonUtils.dart';
import 'package:moviechitchat/utils/Constants.dart';
import 'package:moviechitchat/viewmodels/MessageListViewModel.dart';

class ChatListScreen extends StatefulWidget {

  final Stream<QuerySnapshot<Movie>> movieQuery;
  final String currentUserId;
  final String username;
  final MessageListViewModel messageListViewModel;

  var movies = [];

  ChatListScreen(this.currentUserId, this.movieQuery, this.messageListViewModel, this.username);


  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    widget.movieQuery.listen((event) {
      setState(() {
        widget.movies = event.items;
      });
    });

    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Yes, exit'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            }
        );
        return value == true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1c2f47),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: IconButton(color: Colors.white,
                          onPressed: () {

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title:  const Text('Are you sure?'),
                                content:  const Text('Do you want to Logout'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(false),
                                    child:  const Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () => performLogout(),
                                    child:  const Text('Yes'),
                                  ),
                                ],
                              ),
                            );

                        }, icon: const Icon(Icons.logout),)
                    ),
                    const Spacer(),
                    const Text("Chit-Chat", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: IconButton(color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingScreen()));
                        }, icon: const Icon(Icons.settings),)
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: widget.movies.length,
                              itemBuilder: (context, index) {

                                var movie = widget.movies[index];
                                var image = movie.img;

                                return ListTile(
                                  leading: Container(
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color(0xFF1c2f47),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(Constants.imgBaseUrl + image!),
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(movie.title!),
                                  subtitle: Text(getLatestMessage(movie)),
                                  onTap: (){
                                    navigateToChatScreen(movie);
                                  },
                                );


                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  /*      Recent Message     */
  String getLatestMessage(Movie movie) {
    return movie.recentMessage!.isNotEmpty ? "Recent Message: ${movie.recentMessage!.length <= 2 ?
    movie.recentMessage!.substring(0, 2) :
    movie.recentMessage!.substring(0, 5)}" : "Start Chit-Chat";
  }


  /*    Go to Chat Room     */
  Future<void> navigateToChatScreen(Movie movie) async {
    Stream<QuerySnapshot<Message>> messages = widget.messageListViewModel.observeMessages(movie.id);
    Function sendMessage = widget.messageListViewModel.addMessage;

    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return ChatRoomScreen(movie, widget.currentUserId, messages, sendMessage, widget.username);
      },
    ));
  }


  /*    Logout User     */
  Future<void> performLogout() async {
    try {
      CommonUtils.showSnackBar("Logging Out", context);
      await Amplify.Auth.signOut();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      const LoginScreen()), (Route<dynamic> route) => false);
    } on AuthException catch (e) {
      CommonUtils.showSnackBar(e.message, context);
    }
  }



}


