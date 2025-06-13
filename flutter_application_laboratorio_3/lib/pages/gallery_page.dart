import 'dart:io';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imagePaths; // Lista de rutas de imágenes

  const GalleryPage({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galería de Imágenes')),
      body: imagePaths.isEmpty
          ? const Center(child: Text('No hay imágenes guardadas.'))
          : ListView.builder(
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                final path = imagePaths[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.file(File(path)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Imagen ${index + 1}"),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
