// import 'package:flutter/material.dart';
// import 'package:netflix_clone/screens/games_screen.dart';
// import 'package:netflix_clone/screens/home_screen.dart';
// import 'package:netflix_clone/screens/new_screen.dart';
// import 'package:netflix_clone/screens/profile_screen.dart';

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         backgroundColor: Colors.black45,
//         bottomNavigationBar: Container(
//           color: Colors.black,
//           height: 70,
//           child: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.home),
//                 text: 'Home',
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.games_outlined,
//                 ),
//                 text: 'Games',
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.video_library,
//                 ),
//                 text: 'New & Hot',
//               ),
//               Tab(
//                 // Use Image.asset to load the profile image
//                 icon: Image(
//                   image: AssetImage('assets/Images/profile2.jpg'),
//                   width: 24, // Adjust the size of the image as needed
//                   height: 24,
//                 ),
//                 text: 'My Netflix',
//               ),
//             ],
//             indicatorColor: Colors.transparent,
//             labelColor: Colors.white,
//             unselectedLabelColor: Colors.grey,
//           ),
//         ),
//         body: const TabBarView(children: [
//           HomeScreen(),
//           GamesScreen(),
//           NewScreen(),
//           ProfileScreen()
//         ]),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/games_screen.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/screens/new_screen.dart';
import 'package:netflix_clone/screens/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black45,
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                // Replace icon with text emoji and text
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '🎮', // Game emoji
                      style: TextStyle(fontSize: 18), // Adjust size as needed
                    ),
                    SizedBox(
                        height: 4), // Add some space between emoji and text
                    Text('Games'), // Text for the games tab
                  ],
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.video_library,
                ),
                text: 'New & Hot',
              ),
              Tab(
                // Use Image.asset to load the profile image
                icon: Image(
                  image: AssetImage('assets/Images/profile2.jpg'),
                  width: 24,
                  height: 24,
                ),
                text: 'My Netflix',
              ),
            ],
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: const TabBarView(children: [
          HomeScreen(),
          GamesScreen(),
          NewScreen(),
          ProfileScreen(),
        ]),
      ),
    );
  }
}
