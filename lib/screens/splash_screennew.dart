import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/select_profile.dart';

class SplashScreennew extends StatefulWidget {
  const SplashScreennew({super.key});

  @override
  State<SplashScreennew> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreennew>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SelectProfile()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ClipRect(
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: _animation.value,
                child: Image.asset(
                  'assets/Images/logo.png',
                  width: 300,
                  height: 300,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
