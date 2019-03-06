import 'dart:async';

import 'package:flutter_bloc_pattner_example/src/resources/movie_api_provider.dart';
import 'package:flutter_bloc_pattner_example/src/models/item_model.dart';
import 'package:flutter_bloc_pattner_example/src/models/trailer_model.dart';

class Repository {
  final moviesApi = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApi.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) => moviesApi.fetchTrailer(movieId);
}