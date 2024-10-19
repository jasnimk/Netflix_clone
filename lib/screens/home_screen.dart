import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/controllers/api_services.dart';
import 'package:netflix_clone/widgets/game_card.dart';
import 'package:netflix_clone/widgets/home_screen_widgets.dart';
import 'package:netflix_clone/widgets/main_card.dart';
import 'package:netflix_clone/widgets/movie_card.dart';
import 'package:netflix_clone/widgets/progressed_movie.dart';
import 'package:netflix_clone/widgets/top_ten.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<dynamic> upcomingFuture;
  late Future<dynamic> topRatedFuture;
  late Future<dynamic> nowPlayingFuture;
  late Future<dynamic> seriesFuture;
  late Future<dynamic> onAirFuture;
  late Future<dynamic> trendingFuture;
  late Future<dynamic> gamesFuture;

  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    super.initState();

    upcomingFuture = getFutureUpcoming();
    topRatedFuture = getFuturetop();
    nowPlayingFuture = getFuturenow();
    seriesFuture = getTvFuture();
    onAirFuture = geFutureOnAir();
    trendingFuture = getFutretrending();
    gamesFuture = getGamesFuture();
  }

  getFuturenow() async {
    try {
      return await apiServices.getNowPlayingMovies();
    } catch (e) {
      print('Error fetching now playing movies: $e');

      await Future.delayed(const Duration(seconds: 10));
      return await apiServices.getNowPlayingMovies();
    }
  }

  getGamesFuture() async {
    try {
      return await apiServices.games();
    } catch (e) {
      print('Error fetching games: $e');

      await Future.delayed(const Duration(seconds: 10));
      return await apiServices.games();
    }
  }

  geFutureOnAir() async {
    try {
      return await apiServices.onAirSeries();
    } catch (e) {
      print('Error fetching on air series: $e');

      await Future.delayed(const Duration(seconds: 10));
      return await apiServices.onAirSeries();
    }
  }

  getTvFuture() async {
    try {
      return await apiServices.getTvSeries();
    } catch (e) {
      print('Error fetching tv series: $e');

      await Future.delayed(const Duration(seconds: 10));
      return await apiServices.getTvSeries();
    }
  }

  getFutureUpcoming() async {
    try {
      return await apiServices.getUpcomingMovies();
    } catch (e) {
      print('Error fetching upcoming movies: $e');

      await Future.delayed(const Duration(seconds: 2));
      return await apiServices.getUpcomingMovies();
    }
  }

  getFuturetop() async {
    try {
      return await apiServices.getTopRatedMovies();
    } catch (e) {
      print('Error fetching top ratedmovies: $e');

      await Future.delayed(const Duration(seconds: 7));
      return await apiServices.getTopRatedMovies();
    }
  }

  getFutretrending() async {
    try {
      return await apiServices.trendingMovies();
    } catch (e) {
      print('Error fetching future trending movies: $e');

      await Future.delayed(const Duration(seconds: 7));
      return await apiServices.trendingMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/Images/logo2.png',
              height: 50, // Netflix logo
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.download, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchScreen();
                }));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    categoryButton('TV Shows', onAirFuture, context),
                    const SizedBox(
                      width: 10,
                    ),
                    categoryButton('Movies', upcomingFuture, context),
                    const SizedBox(
                      width: 10,
                    ),
                    categoryButtonWithArrow('Categories', context),
                    //categoryButton('Categories',),
                  ],
                ),
              ),
              Column(
                children: [
                  MainCard(future: upcomingFuture),
                  GameCard(future: gamesFuture, headLine: 'TrendingGames'),
                  const SizedBox(
                    height: 10,
                  ),
                  MovieCard(
                      future: upcomingFuture, headLine: "Upcoming Movies"),
                  const SizedBox(
                    height: 10,
                  ),
                  MovieCard(
                      future: topRatedFuture, headLine: 'Top-Rated Movies'),
                  const SizedBox(
                    height: 10,
                  ),
                  MovieCard(future: seriesFuture, headLine: 'Popular TV shows'),
                  const SizedBox(
                    height: 10,
                  ),
                  ContinueWatchingCard(
                    future: nowPlayingFuture,
                    headLine: 'Continue watching for mkjasni',
                  ),
                  MovieCard(future: onAirFuture, headLine: 'On Air TV shows'),
                  const SizedBox(
                    height: 10,
                  ),
                  MovieCard(future: trendingFuture, headLine: 'Trending Now'),
                  const SizedBox(
                    height: 10,
                  ),
                  TopTen(future: upcomingFuture, headLine: 'Top 10 Movies')
                ],
              ),
            ],
          ),
        ));
  }
}
