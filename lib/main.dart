import 'package:flutter/material.dart';
import 'package:music_player_glass_ui/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player Glass UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: const Color.fromARGB(255, 13, 13, 13),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 13, 13, 13),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
