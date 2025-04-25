import 'package:flutter/material.dart';
import 'about.dart';

class ListContent extends StatelessWidget {
  const ListContent({super.key});

  final List<String> items = const [
    "Elemento 1",
    "Elemento 2",
    "Elemento 3",
    "Elemento 4",
    "Elemento 5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Contenido")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(items[index]),
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
