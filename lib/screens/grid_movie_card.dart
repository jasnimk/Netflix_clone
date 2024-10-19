import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/screens/movie_details_screen.dart';
import 'package:netflix_clone/widgets/home_screen_widgets.dart';

class GridViewMovieCard extends StatefulWidget {
  final Future<dynamic> future;
  final String headLine;

  const GridViewMovieCard(
      {super.key, required this.future, required this.headLine});

  @override
  State<GridViewMovieCard> createState() => _GridViewMovieCardState();
}

class _GridViewMovieCardState extends State<GridViewMovieCard> {
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data?.results == null) {
          return const Center(
              child: Text('No movies available',
                  style: TextStyle(color: Colors.white)));
        }

        var data = snapshot.data.results;

        List<int> newEpisodeIndexes =
            List.generate(5, (_) => _random.nextInt(data.length));

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.headLine,
                style: const TextStyle(
                    fontFamily: "NetflixSansBold",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300, // Adjust this height as needed
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Adjust the number of columns as needed
                    childAspectRatio:
                        2 / 3, // Adjust this ratio for desired card shape
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var movie = data[index];
                    var posterPath = movie.posterPath;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailsScreen(movieId: movie.id),
                          ),
                        );
                      },
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
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
                          if (newEpisodeIndexes.contains(index))
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: newEpisode(),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
