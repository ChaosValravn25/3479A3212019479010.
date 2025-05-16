import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';//para que funcione las imagenes de svg
import 'package:logger/logger.dart';//para emplear el logger 
import 'package:flutter_application_laboratorio_3/pages/about.dart';//llamar el about
import 'package:flutter_application_laboratorio_3/pages/list_content.dart';//llamar list_content

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

   void _navegarSegunParidad() {//para emplear el Navigator
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
      appBar: AppBar(title: const Text("DinoVerse")),
      body: Center(
        child: Card(
          color: Colors.green[50],
          margin: const EdgeInsets.all(16),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Bienvenido a DinoVerse",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text("Has presionado el botón $_counter veces."),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: _decrementCounter, icon: const Icon(Icons.remove)),
                    IconButton(onPressed: _resetCounter, icon: const Icon(Icons.refresh)),
                    IconButton(onPressed: _incrementCounter, icon: const Icon(Icons.add)),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _navegarSegunParidad,
                  child: const Text("Ir a pantalla"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  
  }
}