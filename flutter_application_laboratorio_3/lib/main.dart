import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'pages/home_page.dart'; // ¡Esto es clave! para llamar a home_page

void main() {
  var logger = Logger();
  logger.d("Logger iniciado correctamente");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador Mejorado en Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: 'Lato',
      ),
      home: const MyHomePage(title: 'Contador Mejorado'), // usa el nuevo widget
    );
  }
}