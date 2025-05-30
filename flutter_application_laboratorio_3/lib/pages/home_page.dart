import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';//para que funcione las imagenes de svg
//import 'package:logger/logger.dart';//para emplear el logger 
import 'package:flutter_application_laboratorio_3/pages/about.dart';//llamar el about
//import 'package:flutter_application_laboratorio_3/pages/list_content.dart';//llamar list_content
import 'package:provider/provider.dart';
import 'package:flutter_application_laboratorio_3/provider/app_data.dart';
import 'package:flutter_application_laboratorio_3/pages/preferences_page.dart';
import 'package:flutter_application_laboratorio_3/pages/activity_page.dart';
import 'package:http/http.dart' as http;
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});
  
@override
  State<MyHomePage> createState() {
    
    return _HomePageState();
  }

}



class _HomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();
    
  }

  int _counter = 0;
  String _imageUrl = 'https://picsum.photos/250?image=10'; // Valor inicial

  Future<void> _getNewImage() async {
    final newImageUrl = 'https://picsum.photos/250?image=$_counter';
    try {
      final response = await http.head(Uri.parse(newImageUrl));
      if (response.statusCode == 200) {
        setState(() => _imageUrl = newImageUrl);
      } else {
        setState(() => _imageUrl = '');
      }
    } catch (e) {
      setState(() => _imageUrl = '');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    
  }

  @override
  void deactivate() {
    super.deactivate();
    
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    
  }

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<AppData>();
    

    return Scaffold(
      appBar: AppBar(title: const Text("Estado del Widget")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bienvenido ${data.username}", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text("Contador: ${data.counter}", style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: data.increment, child: const Text("+")),
                ElevatedButton(onPressed: data.decrement, child: const Text("-")),
                if (data.resetEnabled)
                  ElevatedButton(onPressed: data.reset, child: const Text("Reset")),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const About()),
              ),
              child: const Text("Ir a About"),
            ),

            ElevatedButton(
            onPressed: () => Navigator.push(
             context,
            MaterialPageRoute(builder: (_) => const PreferencesPage()),
            ),
            child: const Text("Preferencias"),
            ),
            ElevatedButton(
            onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ActivityPage()),
            ),
            child: const Text("Actividades"),
            ),
  
             Text("Contador: $_counter"),
            const SizedBox(height: 10),
            Image.network(
              _imageUrl.isNotEmpty ? _imageUrl : '',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text("No se pudo cargar la imagen", style: TextStyle(color: Colors.red));
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getNewImage,
              child: const Text("Actualizar imagen"),
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text("Aumentar contador"),
            ),
            
          ],
        ),
      ),
    
    );
  }
}