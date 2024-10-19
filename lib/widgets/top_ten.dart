import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/widgets/home_screen_widgets.dart';

class TopTen extends StatefulWidget {
  final Future<dynamic> future;
  final String headLine;

  const TopTen({super.key, required this.future, required this.headLine});

  @override
  State<TopTen> createState() => _TopTenState();
}

class _TopTenState extends State<TopTen> {
  final Random _random = Random();
  late List<int> newEpisodeIndexes;

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
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length > 10 ? 10 : data.length,
                  itemBuilder: (context, index) {
                    var movie = data[index];
                    var posterPath = movie.posterPath;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: SizedBox(
                        width: 195,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              child: SizedBox(
                                width: 110,
                                height: 160,
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                        fontFamily: 'Outline',
                                        color: Colors.white,
                                        fontSize: 160),
                                  ),
                                ),
                              ),
                            ),
                            // Movie poster
                            Positioned(
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: posterPath != null
                                    ? Stack(
                                        children: [
                                          Image.network(
                                            '$imageUrl$posterPath',
                                            height: 160,
                                            width: 115,
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.high,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                height: 160,
                                                width: 115,
                                                color: Colors.grey,
                                                child: const Center(
                                                  child: Text(
                                                    'Image not available',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        letterSpacing: 0),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          if (newEpisodeIndexes.contains(index))
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              left: 0,
                                              child: Center(
                                                child: newEpisode(),
                                              ),
                                            ),
                                        ],
                                      )
                                    : Container(
                                        height: 160,
                                        width: 115,
                                        color: Colors.grey,
                                        child: const Center(
                                          child: Text(
                                            'No image',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
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
          ),
        );
      },
    );
  }
}
