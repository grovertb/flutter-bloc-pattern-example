import 'package:flutter/material.dart';

import 'package:flutter_bloc_pattner_example/src/models/item_model.dart';
import 'package:flutter_bloc_pattner_example/src/blocs/movies_bloc.dart';
import 'package:flutter_bloc_pattner_example/src/blocs/movie_detail/provider.dart';
import 'package:flutter_bloc_pattner_example/src/ui/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.movies.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data.movies[index].poster_path}',
                fit: BoxFit.cover,
              ),
              onTap: () => openDetailPage(snapshot.data, index),
            ),
          );
        });
  }

  openDetailPage(ItemModel data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetailBlocProvider(
          child: MovieDetail(
            title: data.movies[index].title,
            posterUrl: data.movies[index].backdrop_path,
            description: data.movies[index].overview,
            releaseDate: data.movies[index].release_date,
            voteAverage: data.movies[index].vote_average.toString(),
            movieId: data.movies[index].id,
          ),
        );
      }),
    );
  }
}