import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simpeg_mascitra_mobile/pages/starterPage/welcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIMPEG MASCITRA',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE85A2B),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}