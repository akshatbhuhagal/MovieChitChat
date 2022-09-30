import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:moviechitchat/models/Movie.dart';
import 'package:moviechitchat/utils/CommonUtils.dart';

import '../models/Message.dart';

class MessageListViewModel with ChangeNotifier{


  Stream<QuerySnapshot<Message>> observeMessages(String movieId){
    return Amplify.DataStore.observeQuery(Message.classType, where: Message.MOVIEID.eq(movieId));
  }

  /*     Adding Message     */
  Future<void> addMessage(String message, String fromId, String movieId, String fromName) async {
    String time = CommonUtils.getCurrentTime();
    Message messageToSave = Message(message: message, fromId: fromId, movieId: movieId, timestamp: CommonUtils.getCurrentTime(), fromUsername: fromName);
    await Amplify.DataStore.save(messageToSave);
    await updateMovieLatestMessage(movieId, message, time);
    notifyListeners();
  }

  /*     Recent Message on home     */
  Future<void> updateMovieLatestMessage(String movieId, String message, String time) async {
    // To get the movie
    Movie movie = (await Amplify.DataStore.query(Movie.classType, where: Movie.ID.eq(movieId)))[0];
    // To update the movie
    Movie updatedMovie = movie.copyWith(id: movie.id, recentMessage: message, recentMessageTim: time);
    // To save the movie
    await Amplify.DataStore.save(updatedMovie);
  }
}