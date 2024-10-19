import 'package:flutter/material.dart';

import 'package:netflix_clone/screens/splash_screennew.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 141, 171, 185)),
      title: '',
      home: const SplashScreennew(),
      themeMode: ThemeMode.dark,
    );
  }
}
