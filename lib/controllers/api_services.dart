import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/model/movie_detail_model.dart';
import 'package:netflix_clone/model/rating_model.dart';
import 'package:netflix_clone/model/game_model.dart';
import 'package:netflix_clone/model/genre_model.dart';
import 'package:netflix_clone/model/now_playing.dart';
import 'package:netflix_clone/model/on_air_model.dart';
import 'package:netflix_clone/model/recomendations_model.dart';
import 'package:netflix_clone/model/seach_model.dart';
import 'package:netflix_clone/model/search_games.dart';
import 'package:netflix_clone/model/this_week_model.dart';
import 'package:netflix_clone/model/top_rated_model.dart';
import 'package:netflix_clone/model/trending_model.dart';
import 'package:netflix_clone/model/tv_series_model.dart';
import 'package:netflix_clone/model/upcoming_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://api.themoviedb.org/3/';
var key = "?api_key=$apiKey";
const gameUrl = 'https://api.rawg.io/api/games?key=$apiKeyGame';
const gameagenreUrl = 'https://api.rawg.io/api/genres/';
var keyGame = "?key=$apiKeyGame";
late String endPoint;

class ApiServices {
  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success');
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load upcoming movies!');
  }

  Future<TopRatedMovieModel> getTopRatedMovies() async {
    endPoint = "movie/top_rated";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success');
      return TopRatedMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load upcoming movies!');
  }

  Future<NowPlayingMovieModel> getNowPlayingMovies() async {
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success');
      return NowPlayingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load upcoming movies!');
  }

  Future<GenreId> getMovieGenres() async {
    endPoint = "genre/movie/list";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return GenreId.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load genres!');
  }

  Future<TvSeriesModel> getTvSeries() async {
    endPoint = "tv/popular";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success');
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load upcoming movies!');
  }

  Future<SearchModel> searchMovie(String searchText) async {
    endPoint = "search/tv?query=$searchText";
    final url = "$baseUrl$endPoint";

    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc'
    });

    if (response.statusCode == 200) {
      log('Success');
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load search movies!');
  }

  Future<OnAirModel> onAirSeries() async {
    endPoint = "tv/on_the_air";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success');
      return OnAirModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load upcoming movies!');
  }

  Future<TrendingModel> trendingMovies() async {
    endPoint = "trending/movie/day?language=en-US";
    final url = "$baseUrl$endPoint";

    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc'
    });

    if (response.statusCode == 200) {
      log('Success TRENDING');

      return TrendingModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load search movies!');
  }

  Future<GameModel> games() async {
    // endPoint = "tv/on_the_air";
    const url = gameUrl;

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success');
      return GameModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load games!');
  }

  Future<BestOfYearModel> gamesByGenreAction() async {
    endPoint = "&dates=2024-01-01,2024-12-31&ordering=-rating";
    final url = "$gameUrl$endPoint";
    log(url);

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return BestOfYearModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load games by genre!');
  }

  Future<ThisWeekModel> gamesByWeek() async {
    endPoint = "&dates=2024-10-14,2024-10-21&ordering=-added";
    final url = "$gameUrl$endPoint";
    log(url);

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ThisWeekModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load games by genre!');
  }

  Future<SearchGamesModel> gamesSearch(String searchText) async {
    endPoint = "&search=$searchText";
    final url = "$gameUrl$endPoint";
    log(url);

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return SearchGamesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load games by genre!');
  }

  Future<DetailsMoviesModel> detailsMovies(int movieId) async {
    endPoint = "movie/$movieId";
    final url = "$baseUrl$endPoint";
    log(url);

    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc'
    });

    if (response.statusCode == 200) {
      log('Success details');

      return DetailsMoviesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load search movies!');
  }

  Future<RecommendationsModel> getMovieRecommendations(int movieId) async {
    endPoint = "movie/$movieId/recommendations";
    final url = "$baseUrl$endPoint$key";
    log(url);

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return RecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load movie reccomendations!');
  }
}
