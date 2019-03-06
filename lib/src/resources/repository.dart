import 'dart:async';
import 'movie_api.dart';
import '../models/item_model.dart';
import '../models/trailer_model.dart';

class Repository {
  final moviesApi = MovieApi();

  Future<ItemModel> fetchAllMovies() => moviesApi.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) => moviesApi.fetchTrailer(movieId);
}