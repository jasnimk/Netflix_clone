import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/controllers/api_services.dart';
import 'package:netflix_clone/model/trending_model.dart';
import 'package:netflix_clone/model/tv_series_model.dart';
import 'package:netflix_clone/model/upcoming_model.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/widgets/movie_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<TrendingModel> trendingFuture;
  late Future<TvSeriesModel> tvSeriesFuture;

  ApiServices apiServices = ApiServices();

  void initState() {
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovies();
    trendingFuture = apiServices.trendingMovies();
    tvSeriesFuture = apiServices.getTvSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'My Netflix',
          style: TextStyle(
              color: Colors.white, fontFamily: 'NetflixSansBold', fontSize: 30),
        ),
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchScreen();
              }));
            },
          ),
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.bars,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: AssetImage('assets/Images/profile2.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text(
                            'mkjasni',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red[800]),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: (FaIcon(
                          FontAwesomeIcons.bell,
                          color: Colors.white,
                        )),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Notifications',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NetflixSansBold',
                        fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[300]),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: (Icon(
                          Icons.download,
                          color: Colors.white,
                        )),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Downloads',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NetflixSansBold',
                        fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MovieCard(
                future: upcomingFuture,
                headLine: 'TV Shows & Movies You have Liked'),
            MovieCard(
                future: trendingFuture, headLine: "Trailers You Have Watched"),
            MovieCard(future: tvSeriesFuture, headLine: 'Recently Watched')
          ],
        ),
      ),
    );
  }
}
