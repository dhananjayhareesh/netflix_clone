import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/model/Movie.dart';
import 'package:netflix/model/searchmodel.dart';
import 'package:netflix/model/series.dart';
import 'package:netflix/service/apiservice.dart';

Future<List<Movie>> getnowplaying() async {
  const url = 'https://api.themoviedb.org/3/trending/movie/day?$apikey';
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjcyMWMyODQ4OTYyZmE2MTZkZjUxNGMyYTJiZmVhNCIsInN1YiI6IjY1YjEwNjdjMjc5MGJmMDE3MjU2M2MwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pybb4ojBy8ZKC-xtJXPR8rjQQxbgVp4AN7ctOP2uFdc',
      'accept': 'application/json',
    },
  );
  final json = jsonDecode(response.body)['results'] as List;

  final result = json.map((e) => Movie.fromjason(e)).toList();
  return result;
}

Future<List<Movie>> topRatedMovies() async {
  const url = 'https://api.themoviedb.org/3/movie/top_rated?$apikey';

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjcyMWMyODQ4OTYyZmE2MTZkZjUxNGMyYTJiZmVhNCIsInN1YiI6IjY1YjEwNjdjMjc5MGJmMDE3MjU2M2MwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pybb4ojBy8ZKC-xtJXPR8rjQQxbgVp4AN7ctOP2uFdc',
      'accept': 'application/json',
    },
  );
  final json = jsonDecode(response.body)["results"] as List;
  final result = json.map((e) => Movie.fromjason(e)).toList();
  return result;
}

Future<List<Series>> tvDramas() async {
  const url = 'https://api.themoviedb.org/3/trending/tv/day?$apikey';

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjcyMWMyODQ4OTYyZmE2MTZkZjUxNGMyYTJiZmVhNCIsInN1YiI6IjY1YjEwNjdjMjc5MGJmMDE3MjU2M2MwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pybb4ojBy8ZKC-xtJXPR8rjQQxbgVp4AN7ctOP2uFdc',
      'accept': 'application/json',
    },
  );

  final json = jsonDecode(response.body)["results"] as List;
  final result = json.map((e) => Series.fromjason(e)).toList();
  return result;
}

Future<List<Series>> airingtoday() async {
  const url = 'https://api.themoviedb.org/3/tv/airing_today?$apikey';

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjcyMWMyODQ4OTYyZmE2MTZkZjUxNGMyYTJiZmVhNCIsInN1YiI6IjY1YjEwNjdjMjc5MGJmMDE3MjU2M2MwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pybb4ojBy8ZKC-xtJXPR8rjQQxbgVp4AN7ctOP2uFdc',
      'accept': 'application/json',
    },
  );

  final json = jsonDecode(response.body)["results"] as List;
  final result = json.map((e) => Series.fromjason(e)).toList();
  return result;
}

Future<List<Movie>> upcoming() async {
  const url = 'https://api.themoviedb.org/3/movie/upcoming?$apikey';
  final headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjcyMWMyODQ4OTYyZmE2MTZkZjUxNGMyYTJiZmVhNCIsInN1YiI6IjY1YjEwNjdjMjc5MGJmMDE3MjU2M2MwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pybb4ojBy8ZKC-xtJXPR8rjQQxbgVp4AN7ctOP2uFdc',
    'accept': 'application/json',
  };

  final response = await http.get(Uri.parse(url), headers: headers);

  final json = jsonDecode(response.body)["results"] as List;
  final result = json.map((e) => Movie.fromjason(e)).toList();
  return result;
}

Future<List<Movie>> newRealease() async {
  const url = 'https://api.themoviedb.org/3/movie/popular?$apikey';
  final headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjcyMWMyODQ4OTYyZmE2MTZkZjUxNGMyYTJiZmVhNCIsInN1YiI6IjY1YjEwNjdjMjc5MGJmMDE3MjU2M2MwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pybb4ojBy8ZKC-xtJXPR8rjQQxbgVp4AN7ctOP2uFdc',
    'accept': 'application/json',
  };

  final response = await http.get(Uri.parse(url), headers: headers);

  final json = jsonDecode(response.body)["results"] as List;
  final result = json.map((e) => Movie.fromjason(e)).toList();
  return result;
}

Future<List<SearchModel>> getSearchResults(String name) async {
  final searchurl = '/search/multi?query={name}&'.replaceFirst('{name}', name);
  final headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjcyMWMyODQ4OTYyZmE2MTZkZjUxNGMyYTJiZmVhNCIsInN1YiI6IjY1YjEwNjdjMjc5MGJmMDE3MjU2M2MwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pybb4ojBy8ZKC-xtJXPR8rjQQxbgVp4AN7ctOP2uFdc',
    'accept': 'application/json',
  };
  final response = await http.get(
    headers: headers,
    Uri.parse('https://api.themoviedb.org/3$searchurl$apikey'),
  );
  final decodedResult = jsonDecode(response.body)['results'] as List;

  final results =
      decodedResult.map((result) => SearchModel.fromjson(result)).toList();

  return results;
}

Future<List<SearchModel>> getTreandingMoviesAndSeries() async {
  final headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjcyMWMyODQ4OTYyZmE2MTZkZjUxNGMyYTJiZmVhNCIsInN1YiI6IjY1YjEwNjdjMjc5MGJmMDE3MjU2M2MwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pybb4ojBy8ZKC-xtJXPR8rjQQxbgVp4AN7ctOP2uFdc',
    'accept': 'application/json',
  };
  final response = await http.get(
    headers: headers,
    Uri.parse('https://api.themoviedb.org/3/trending/all/day?$apikey'),
  );

  print(response.body);
  final decodedResult = jsonDecode(response.body)['results'] as List;

  final results =
      decodedResult.map((result) => SearchModel.fromjson(result)).toList();

  return results;
}
