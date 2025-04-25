import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';//para que funcione las imagenes de svg
import 'package:logger/logger.dart';//para emplear el logger 
import 'package:flutter_application_laboratorio_3/pages/about.dart';
import 'package:flutter_application_laboratorio_3/pages/list_content.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final Logger logger = Logger();

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
            SvgPicture.asset(
              'assets/icons/snake.svg',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
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