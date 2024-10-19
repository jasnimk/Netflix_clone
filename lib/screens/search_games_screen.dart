import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';

import 'package:netflix_clone/controllers/api_services.dart';
import 'package:netflix_clone/model/search_games.dart';
import 'package:netflix_clone/widgets/movie_card.dart';
import 'package:netflix_clone/widgets/movie_card_vertiical.dart';

class SearchGames extends StatefulWidget {
  const SearchGames({super.key});

  @override
  State<SearchGames> createState() => _SearchGamesState();
}

class _SearchGamesState extends State<SearchGames> {
  TextEditingController searchController = TextEditingController();
  ApiServices apiServices = ApiServices();
  SearchGamesModel? searchModel;
  bool isSearching = false;

  late Future<dynamic> upcomingFuture;
  late Future<dynamic> seriesFuture;

  @override
  void initState() {
    super.initState();
    upcomingFuture = getFutureUpcoming();
    seriesFuture = getTvFuture();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<dynamic> getFutureUpcoming() async {
    try {
      return await apiServices.getUpcomingMovies();
    } catch (e) {
      print('Error fetching upcoming movies: $e');
      await Future.delayed(const Duration(seconds: 2));
      return await apiServices.getUpcomingMovies();
    }
  }

  Future<dynamic> getTvFuture() async {
    try {
      return await apiServices.getTvSeries();
    } catch (e) {
      print('Error fetching TV series: $e');
      await Future.delayed(const Duration(seconds: 10));
      return await apiServices.getTvSeries();
    }
  }

  void search(String query) {
    apiServices.gamesSearch(query).then((results) {
      setState(() {
        searchModel = results;
        isSearching = true;
      });
    });
  }

  Widget _buildMovieItem(dynamic movie) {
    String imageUrl = movie.backgroundImage != null
        ? '${movie.backgroundImage}'
        : 'assets/images/placeholder.png'; // Path to your local placeholder image

    return GestureDetector(
      onTap: () {},
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: SizedBox(
            height: 200,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey,
                  child: const Icon(Icons.error),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 30,
            child: Text(
              movie.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildSearchResults() {
    return Expanded(
      child: searchModel != null && searchModel!.results.isNotEmpty
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.7,
              ),
              itemCount: searchModel!.results.length,
              itemBuilder: (context, index) {
                return _buildMovieItem(searchModel!.results[index]);
              },
            )
          : const Center(
              child: Text(
                'No results found.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          automaticallyImplyLeading: false,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.download,
                color: Colors.white,
              ),
            ),
          ],
          //title: const Text('Search games'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: CupertinoSearchTextField(
                  itemColor: Colors.white,
                  controller: searchController,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        isSearching = false;
                        searchModel = null;
                      });
                    } else {
                      search(value);
                    }
                  },
                  placeholder: 'Search for Games',
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'NetflixSansLight'),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                  child: Column(
                children: [
                  if (!isSearching) ...[
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            MovieCard(
                                future: upcomingFuture,
                                headLine: "Upcoming Movies"),
                            const SizedBox(height: 16),
                            const SizedBox(height: 8),
                            MovieCardVertical(
                                future: seriesFuture,
                                headLine: 'Trending TV Shows')
                          ],
                        ),
                      ),
                    ),
                  ] else
                    _buildSearchResults(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
