import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/screens/movie_details_screen.dart';
import 'package:netflix_clone/widgets/home_screen_widgets.dart';

class GridViewMovieScreen extends StatefulWidget {
  final Future<dynamic> future;
  final String title;

  const GridViewMovieScreen(
      {Key? key, required this.future, required this.title})
      : super(key: key);

  @override
  State<GridViewMovieScreen> createState() => _GridViewMovieScreenState();
}

class _GridViewMovieScreenState extends State<GridViewMovieScreen> {
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "NetflixSansBold",
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: widget.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.white)));
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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
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
                                    child: const Icon(Icons.broken_image,
                                        color: Colors.black),
                                  );
                                },
                              )
                            : Container(
                                color: Colors.grey[300],
                                child: const Icon(Icons.broken_image,
                                    color: Colors.black),
                              ),
                      ),
                      if (newEpisodeIndexes.contains(index))
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(child: newEpisode()),
                        ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
