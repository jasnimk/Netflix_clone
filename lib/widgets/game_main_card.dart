import 'package:flutter/material.dart';
import 'package:netflix_clone/controllers/api_services.dart';
import 'package:netflix_clone/widgets/home_screen_widgets.dart';

class GameMainCard extends StatefulWidget {
  final Future<dynamic> future;

  const GameMainCard({super.key, required this.future});

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<GameMainCard> {
  List<dynamic> genreList = [];
  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
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

        var game = data[1];
        var posterPath2 = game.backgroundImage;
        var name = game.name;

        return Padding(
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
                  child: posterPath2 != null
                      ? Image.network(
                          "$posterPath2",
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
                  bottom: 90,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: Text(
                      '$name',
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontFamily: 'NetflixSansBold',
                          letterSpacing: 1.2),
                      textAlign:
                          TextAlign.center, // Aligns the text in the center
                      maxLines: 2, // Limits the text to a maximum of 3 lines
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
