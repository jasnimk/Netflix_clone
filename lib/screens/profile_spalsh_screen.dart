import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/bottom_nav.dart'; // Adjust the import based on your project structure

class ProfileSplashScreen extends StatefulWidget {
  final String image;
  const ProfileSplashScreen({super.key, required this.image});

  @override
  _ProfileSplashScreenState createState() => _ProfileSplashScreenState();
}

class _ProfileSplashScreenState extends State<ProfileSplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          widget.image,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
