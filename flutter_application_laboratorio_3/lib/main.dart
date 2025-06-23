import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'pages/splash_screen.dart';
void main() {
  var logger = Logger();
  logger.d("Logger iniciado correctamente");

  runApp(const DinoVerseApp());
}

class DinoVerseApp extends StatelessWidget {
  const DinoVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DinoVerse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        
      ),
      home: SplashScreen(),
    );
  }
}