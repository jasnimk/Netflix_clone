import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/model/genre_model.dart';
import 'package:netflix_clone/controllers/api_services.dart';
import 'package:netflix_clone/screens/movie_details_screen.dart';
import 'package:netflix_clone/widgets/home_screen_widgets.dart';

class MainCard extends StatefulWidget {
  final Future<dynamic> future;

  const MainCard({super.key, required this.future});

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  List<dynamic> genreList = [];
  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    fetchGenres();
  }

  Future<void> fetchGenres() async {
    try {
      final genres = await apiServices.getMovieGenres();
      setState(() {
        genreList = genres.genres;
      });
    } catch (e) {
      print('Error fetching genres: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data.results == null) {
          return const Center(
            child: Text(
              'No movies available',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        var data = snapshot.data.results;

        if (data.isEmpty) {
          return const Center(
            child: Text(
              'Not enough movies available',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        // final randomIndex = Random().nextInt(data.length);
        //final movie = data[randomIndex];
        final movie = data[0];
        final posterPath = movie.posterPath;

        final genreNames = movie.genreIds.map((id) {
          final genre = genreList.firstWhere(
            (genre) => genre.id == id,
            orElse: () => Genre(id: 0, name: 'Unknown'),
          );
          return genre.name;
        }).toList();

        return GestureDetector(
          onTap: () {
            // Navigate to the MovieDetails screen when a card is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(movieId: movie.id),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: posterPath != null
                        ? Image.network(
                            "$imageUrl$posterPath",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.black,
                                ),
                              );
                            },
                          )
                        : Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.broken_image,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: playList(),
                ),
                Positioned(
                  bottom: 80,
                  left: MediaQuery.of(context).size.width / 2 -
                      (genreNames.length * 90 / 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: genreNames
                        .map((name) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Text(
                              '▪️$name',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'NetflixSansRegular',
                                shadows: [
                                  Shadow(
                                    blurRadius: 4.0,
                                    color: Colors.black,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                        .toList()
                        .cast<Widget>(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
