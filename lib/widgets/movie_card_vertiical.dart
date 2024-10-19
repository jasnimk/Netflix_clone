// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/screens/movie_details_screen.dart'; // Assuming imageUrl is defined here

class MovieCardVertical extends StatelessWidget {
  final Future<dynamic> future;
  final String headLine;

  const MovieCardVertical({
    Key? key,
    required this.future,
    required this.headLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data?.results == null) {
          return const Center(
            child: Text(
              'No movies available',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        var data = snapshot.data.results;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Shrink-wrap the column
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                headLine,
                style: const TextStyle(
                  fontFamily: "NetflixSansBold",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // Wrapping ListView.builder in a Flexible or providing height constraint
            SizedBox(
              height: 300, // Provide a specific height
              child: ListView.builder(
                shrinkWrap:
                    true, // Ensures ListView only takes necessary height
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var movie = data[index];
                  var posterPath = movie.posterPath;
                  var movieName = movie.originalName;

                  return GestureDetector(
                    onTap: () {
                      // Navigate to the MovieDetails screen when a card is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailsScreen(movieId: movie.id),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SizedBox(
                              width: 100,
                              height: 150,
                              child: posterPath != null
                                  ? Image.network(
                                      "$imageUrl$posterPath",
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movieName ?? 'Unknown Title',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
