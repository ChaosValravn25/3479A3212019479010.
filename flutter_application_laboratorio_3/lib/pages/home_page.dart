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

   void _navegarSegunParidad() {
    if (_counter % 2 == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ListContent()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const About()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/icons/snake.svg',//icono serpiente
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Flutter es un framework UI de Google.',//las letras descargadas por google font
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Contador: $_counter',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: _decrementCounter, icon: const Icon(Icons.remove)),
                    IconButton(onPressed: _resetCounter, icon: const Icon(Icons.refresh)),
                    IconButton(onPressed: _incrementCounter, icon: const Icon(Icons.add)),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _navegarSegunParidad,
                  child: const Text("Ir a pantalla condicional"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}