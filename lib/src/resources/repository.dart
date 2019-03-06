import 'dart:async';
import 'movie_api.dart';
import '../models/item_model.dart';

class Repository {
  final moviesApi = MovieApi();

  Future<ItemModel> fetchAllMovies() => moviesApi.fetchMovieList();
}