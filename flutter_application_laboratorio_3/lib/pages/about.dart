import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_laboratorio_3/provider/app_data.dart';
class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AppData>(context);
    final controller = TextEditingController(text: data.username);

    return Scaffold(
      appBar: AppBar(title: const Text("Acerca del Desarrollador")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nombre de Usuario:"),
            TextField(
              controller: controller,
              onChanged: (value) => data.setUsername(value),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text("Permitir Reset"),
              value: data.resetEnabled,
              onChanged: data.toggleReset,
            ),
          ],
        ),
      ),
    );
  }
}
