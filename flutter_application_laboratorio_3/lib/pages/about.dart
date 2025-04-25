import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sobre la app")),
      body: const Center(
        child: Text(
          "Aplicación hecha en Flutter para laboratorio.\nAutor: Ivonne Santander Soto",//colocar el nombre del desarrollador
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),//un pequeño boton 
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
