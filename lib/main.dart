import 'package:flutter/material.dart';
import 'package:viva_practical/screens/detail_page.dart';
import 'package:viva_practical/screens/home_page.dart';
import 'package:viva_practical/screens/splash_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: "Splash",
      routes: {
        "/": (context) => const HomePage(),
        "Splash": (context) => const SplashPage(),
        "detail": (context) => const DetailPage(),
      },
    ),
  );
}
