class TrailerModel {
  int _id;
  List<_Trailer> _trailers = [];

  TrailerModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    List<_Trailer> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Trailer result = _Trailer(parsedJson['results'][i]);
      temp.add(result);
    }
    _trailers = temp;
  }

  List<_Trailer> get trailers => _trailers;

  int get id => _id;
}

class _Trailer {
  String _id;
  String _iso_639_1;
  String _iso_3166_1;
  String _key;
  String _name;
  String _site;
  int _size;
  String _type;

  _Trailer(trailer) {
    _id = trailer['id'];
    _iso_639_1 = trailer['iso_639_1'];
    _iso_3166_1 = trailer['iso_3166_1'];
    _key = trailer['key'];
    _name = trailer['name'];
    _site = trailer['site'];
    _size = trailer['size'];
    _type = trailer['type'];
  }

  String get id => _id;

  String get iso_639_1 => _iso_639_1;

  String get iso_3166_1 => _iso_3166_1;

  String get key => _key;

  String get name => _name;

  String get site => _site;

  int get size => _size;

  String get type => _type;
}