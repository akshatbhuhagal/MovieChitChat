import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import '../models/Movie.dart';

class MovieListViewModel with ChangeNotifier{

  Stream<QuerySnapshot<Movie>> observeMovies(){
    return Amplify.DataStore.observeQuery(Movie.classType);
  }

}