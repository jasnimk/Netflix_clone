import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/controllers/api_services.dart';
import 'package:netflix_clone/model/game_model.dart';
import 'package:netflix_clone/model/trending_model.dart';
import 'package:netflix_clone/model/upcoming_model.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/widgets/comingsoon_movie_widget.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  late Future<UpcomingMovieModel> _upcomingMovies;
  late Future<TrendingModel> trendingFuture;
  late Future<GameModel> gameFuture;
  ApiServices apiServices = ApiServices();

  final Map<int, String> _monthNames = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec'
  };

  @override
  void initState() {
    super.initState();
    _upcomingMovies = apiServices.getUpcomingMovies();
    trendingFuture = apiServices.trendingMovies();
    gameFuture = apiServices.games();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: const Text(
              'New & Hot',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: kBackgroundColor,
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
            bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: true,
              indicatorPadding: const EdgeInsets.only(top: 8, bottom: 8),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              unselectedLabelColor: Colors.white,
              tabs: const [
                SizedBox(
                  height: 40,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      ' 🍿 Coming Soon  ',
                      style: TextStyle(fontFamily: 'NetflixSansBold'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      " 🔥  Everyone's watching  ",
                      style: TextStyle(fontFamily: 'NetflixSansBold'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "  🎮  Games   ",
                      style: TextStyle(fontFamily: 'NetflixSansBold'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FutureBuilder<UpcomingMovieModel>(
                future: _upcomingMovies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData ||
                      snapshot.data!.results == null) {
                    return const Center(child: Text('No data available'));
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: snapshot.data!.results!.map((movie) {
                          String monthName =
                              _monthNames[movie.releaseDate?.month ?? 1] ??
                                  'Jan';
                          return ComingSoonMovieWidget(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${movie.backdropPath ?? ''}',
                            overview: movie.overview ?? '',
                            logoUrl:
                                'https://image.tmdb.org/t/p/w500${movie.posterPath ?? ''}',
                            month: monthName,
                            day: movie.releaseDate?.day.toString() ?? '',
                            title: movie.title ?? 'Untitled',
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
              FutureBuilder<TrendingModel>(
                future: trendingFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('No data available'));
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: snapshot.data!.results.map((movie) {
                          String monthName =
                              _monthNames[movie.releaseDate.month] ?? 'Jan';
                          return ComingSoonMovieWidget(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                            overview: movie.overview,
                            logoUrl:
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            month: monthName,
                            day: movie.releaseDate.day.toString(),
                            title: movie.title,
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
              FutureBuilder<GameModel>(
                future: gameFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('No data available'));
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: snapshot.data!.results.map((movie) {
                          String monthName =
                              _monthNames[movie.released?.month ?? 1] ?? 'Jan';
                          return ComingSoonMovieWidget(
                            imageUrl: movie.backgroundImage ?? '',
                            overview: '',
                            logoUrl: '${movie.shortScreenshots}',
                            month: monthName,
                            day: movie.released?.day.toString() ?? '',
                            title: movie.name,
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
