import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/profile_spalsh_screen.dart';

class SelectProfile extends StatelessWidget {
  const SelectProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Image.asset(
          'assets/Images/logo.png',
          height: 60,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Who's Watching?",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'NetflixSansLight',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildProfileTile(
                context,
                imagePath: 'assets/Images/profile2.jpg',
                label: 'mkjasni',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileSplashScreen(
                          image: 'assets/Images/profile2.jpg'),
                    ),
                  );
                },
              ),
              const SizedBox(width: 20),
              buildProfileTile(
                context,
                imagePath: 'assets/Images/profile.jpg',
                label: 'Children',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileSplashScreen(
                          image: 'assets/Images/profile.jpg'),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              buildAddProfileTile(context),
            ],
          ),
        ],
      ),
    );
  }

  // Function to build a profile tile
  buildProfileTile(BuildContext context,
      {required String imagePath, required String label, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap, // Handle tap event
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'NetflixSans',
            ),
          ),
        ],
      ),
    );
  }

  // Function to build the "Add Profile" tile
  buildAddProfileTile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 50,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Add Profile',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NetflixSans',
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
