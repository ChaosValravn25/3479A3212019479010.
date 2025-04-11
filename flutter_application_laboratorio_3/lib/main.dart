import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Asegurar que se usa correctamente
import 'package:logger/logger.dart';

void main() {
  var logger = Logger();
  logger.d("Logger iniciado correctamente"); // Mensaje de prueba

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador Mejorado en Flutter', // Cambio del título
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // Cambio de color
        fontFamily: 'BungeeSpice', // Fuente personalizada
      ),
      home: const MyHomePage(title: 'Contador Mejorado'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final Logger logger = Logger(); // Logger para esta clase

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    logger.i("Contador incrementado a $_counter");
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    logger.w("Contador decrementado a $_counter");
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    logger.e("Contador reiniciado");
  }

  Widget botonesInferiores() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _decrementCounter,
          child: const Icon(Icons.remove),
        ),
        ElevatedButton(
          onPressed: _resetCounter,
          child: const Icon(Icons.refresh),
        ),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icono SVG agregado
            SvgPicture.asset(
              'assets/icons/animal-carnivore-cartoon-5-svgrepo-com.svg', // Asegúrate de que el archivo existe
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20), // Espaciado entre elementos
            const Text('Has presionado el botón estas veces:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      persistentFooterButtons: [botonesInferiores()],
    );
  }
}
