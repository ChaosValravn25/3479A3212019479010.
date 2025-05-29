import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/app_data.dart';
import 'pages/home_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
void main() {

  // Inicialización requerida para Windows/Linux/MacOS
  sqfliteFfiInit(); // ← Inicializa sqflite_common_ffi

  // Configura la fábrica de base de datos para entornos de escritorio
  databaseFactory = databaseFactoryFfi;

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<AppData>(context);
    return MaterialApp(
      title: 'Flutter Estados Widget',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        
      ),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.darkMode ? ThemeMode.dark : ThemeMode.light,
      home: const MyHomePage(title: 'Página Principal'),
    );
  }
}