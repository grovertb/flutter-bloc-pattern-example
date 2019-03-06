import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc_pattner_example/src/models/item_model.dart';
import 'package:flutter_bloc_pattner_example/src/models/trailer_model.dart';

class MovieApiProvider {
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<ItemModel> fetchMovieList() async {
    final response = await http.get("$_baseUrl/popular?api_key=$_apiKey");
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response = await http.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");
    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}