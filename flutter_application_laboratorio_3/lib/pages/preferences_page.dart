import 'package:flutter/material.dart';
import 'package:flutter_application_laboratorio_3/provider/app_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';



class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  late SharedPreferences prefs;
  String username = "";
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      darkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  void _savePreferences() {
    prefs.setString('username', username);
    prefs.setBool('darkMode', darkMode);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppData>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Preferencias")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Nombre de usuario"),
              onChanged: (value) => username = value,
            ),
            SwitchListTile(
              title: const Text("Modo oscuro"),
              value: darkMode,
              onChanged: (value) {
                setState(() => darkMode = value);
                themeProvider.toggleTheme(value);
              },
            ),
            ElevatedButton(
              onPressed: () {
                _savePreferences();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Preferencias guardadas")),
                );
              },
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
