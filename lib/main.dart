import 'package:flutter/material.dart';
import 'package:netflix/screens/home.dart';
import 'package:netflix/service/functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getnowplaying();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Homescreen(),
    );
  }
}
