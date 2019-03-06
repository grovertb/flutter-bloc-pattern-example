import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattner_example/src/blocs/movie_detail/index.dart';
export 'package:flutter_bloc_pattner_example/src/blocs/movie_detail/index.dart';

class MovieDetailBlocProvider extends InheritedWidget {
  // final MovieDetailBloc bloc;

  // MovieDetailBlocProvider({Key key, Widget child}): bloc = MovieDetailBloc(), super(key: key, child: child);

  final bloc = MovieDetailBloc();

  MovieDetailBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static MovieDetailBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MovieDetailBlocProvider) as MovieDetailBlocProvider).bloc;
  }
}