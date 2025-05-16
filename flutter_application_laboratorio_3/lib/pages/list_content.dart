import 'package:flutter/material.dart';
import 'about.dart';//llamar el boton de acerca del desarrollador

class ListContent extends StatelessWidget {
  const ListContent({super.key});

  
  final List<String> dinos = const [
    "Tyrannosaurus Rex",
    "Triceratops",
    "Velociraptor",
    "Brachiosaurus",
    "Spinosaurus",
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Dinosaurios")),
      body: ListView.builder(
        itemCount: dinos.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(dinos[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const About()),
          );
        },
        child: const Icon(Icons.info),
      ),
    );
  }
}
