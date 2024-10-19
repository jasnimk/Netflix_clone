import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/controllers/api_services.dart';
import 'package:netflix_clone/model/movie_detail_model.dart';
import 'package:netflix_clone/model/recomendations_model.dart';
import 'package:netflix_clone/screens/search_screen.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final ApiServices _apiServices = ApiServices();
  late Future<DetailsMoviesModel> _movieDetail;
  late Future<RecommendationsModel> movieRecommendations;

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  void _fetchInitialData() {
    _movieDetail = _apiServices.detailsMovies(widget.movieId);
    movieRecommendations = _apiServices.getMovieRecommendations(widget.movieId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
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
      body: FutureBuilder<DetailsMoviesModel>(
        future: _movieDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No movie details available',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          final movie = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              '$imageUrl${movie.posterPath ?? ''}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/Images/logo2.png',
                            height: 50,
                          ),
                          const Text(
                            'M O V I E',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Text(
                        movie.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: 'NetflixSansBold'),
                      ),
                      Row(
                        children: [
                          Text(
                            movie.releaseDate.year.toString(),
                            style: const TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Rating: ${movie.voteAverage.toStringAsFixed(1)}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                            ),
                          ),
                          onPressed: () {},
                          label: const Text(
                            'Play',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 48, 46, 46),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                            ),
                          ),
                          onPressed: () {},
                          label: const Text(
                            'Download',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          icon: const Icon(
                            Icons.download,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Text(
                        movie.overview,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      FutureBuilder<RecommendationsModel>(
                        future: movieRecommendations,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}',
                                style: const TextStyle(color: Colors.white));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.results.isEmpty) {
                            return const SizedBox();
                          }

                          final movieRecommendations = snapshot.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'More Like This',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                  childAspectRatio: 0.7,
                                ),
                                itemCount: movieRecommendations.results.length,
                                itemBuilder: (context, index) {
                                  final recommendation =
                                      movieRecommendations.results[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailsScreen(
                                                  movieId: recommendation.id),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              '$imageUrl${recommendation.posterPath}'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
