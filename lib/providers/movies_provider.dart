import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';
import 'package:peliculas/models/upcoming_response.dart';

class MoviesProvider extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  String _api_key = 'ccf943d89dd26fe735697ad7db9fe252';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> upcomingMovies = [];

  MoviesProvider() {
    print('Movides Provider inicializado');

    this.getonDisplayMovies();
    this.getPopularMovies();
    this.getUpcomingMovies();
  }

  getonDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _api_key,
      'language': _language,
      'page': '1',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    // ignore: unused_local_variable
    final Map<String, dynamic> decodedData = json.decode(response.body);
    // print(decodedData['results']);
    // print(nowPlayingResponse.results[2].title);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    final url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _api_key,
      'language': _language,
      'page': '1',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    // ignore: unused_local_variable
    final Map<String, dynamic> decodedData = json.decode(response.body);
    // print(decodedData['results']);
    // print(nowPlayingResponse.results[2].title);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
    // print(popularMovies);
  }

  getUpcomingMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/upcoming', {
      'api_key': _api_key,
      'language': _language,
      'page': '1',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final upComingResponse = UpcomingResponse.fromJson(response.body);
    // ignore: unused_local_variable
    final Map<String, dynamic> decodedData = json.decode(response.body);
    // print(decodedData['results']);
    // print(nowPlayingResponse.results[2].title);

    upcomingMovies = [...upcomingMovies, ...upComingResponse.results];
    notifyListeners();
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _api_key,
      'language': _language,
      'query': query,
    });

    final response = await http.get(url);
    final searchResponse = SearchMovieResponse.fromJson(response.body);

    return searchResponse.results;
  }
}
