import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/home_screen_widgets.dart';

class GameCard extends StatefulWidget {
  final Future<dynamic> future;
  final String headLine;

  const GameCard({super.key, required this.future, required this.headLine});

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
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
              child: Text('No GAMES available',
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
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var game = data[index];
                    var posterPath = game.backgroundImage;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SizedBox(
                          height: 120,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: posterPath != null
                                    ? Image.network(
                                        "$posterPath",
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
                              if (newEpisodeIndexes.contains(index))
                                // Place the newEpisode widget at the bottom center
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: newEpisodeGames(),
                                  ),
                                ),
                            ],
                          ),
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
