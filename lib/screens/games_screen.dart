import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/controllers/api_services.dart';
import 'package:netflix_clone/screens/search_games_screen.dart';
import 'package:netflix_clone/widgets/game_card.dart';
import 'package:netflix_clone/widgets/game_main_card.dart';
import 'package:netflix_clone/widgets/game_new.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  late Future<dynamic> gamesFuture;
  late Future<dynamic> gameAction;
  late Future<dynamic> gameThisWeek;

  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    super.initState();

    gamesFuture = getGamesFuture();
    gameAction = getActionfunc();
    gameThisWeek = getThisWeek();
  }

  getActionfunc() async {
    try {
      return await apiServices.gamesByGenreAction();
    } catch (e) {
      print('Error fetching now playing movies: $e');

      await Future.delayed(const Duration(seconds: 10));
      return await apiServices.gamesByGenreAction();
    }
  }

  getThisWeek() async {
    try {
      return await apiServices.gamesByWeek();
    } catch (e) {
      print('Error fetching now playing movies: $e');

      await Future.delayed(const Duration(seconds: 10));
      return await apiServices.gamesByWeek();
    }
  }

  getGamesFuture() async {
    try {
      return await apiServices.games();
    } catch (e) {
      print('Error fetching now playing movies: $e');

      await Future.delayed(const Duration(seconds: 10));
      return await apiServices.games();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Games',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: kBackgroundColor,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchGames();
                }));
              },
            ),
          ],
        ),
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              GameMainCard(future: gamesFuture),
              GameCard(future: gamesFuture, headLine: 'Trending Games'),
              const SizedBox(
                height: 10,
              ),
              // GameNew(future: gameAction, headLine: 'Action Games'),
              // const SizedBox(
              //   height: 10,
              // ),
              GameCard(future: gameThisWeek, headLine: 'Trending this Week'),
              const SizedBox(
                height: 10,
              ),
              GameCard(future: gameAction, headLine: 'Best Of Year')
            ],
          ),
        ));
  }
}
