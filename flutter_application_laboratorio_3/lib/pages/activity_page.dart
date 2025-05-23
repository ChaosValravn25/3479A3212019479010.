import 'package:flutter/material.dart';
import '../db/activity_database.dart';
import '../models/activity.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<Activity> activities = [];

  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  Future<void> _loadActivities() async {
    final loaded = await ActivityDatabase.getActivities();
    setState(() {
      activities = loaded;
    });
  }

  void _addActivity(String description) async {
    final newActivity = Activity(description: description);
    await ActivityDatabase.insertActivity(newActivity);
    _loadActivities();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Actividades")),
      body: Column(
        children: [
          TextField(controller: controller),
          ElevatedButton(
            onPressed: () => _addActivity(controller.text),
            child: const Text("Agregar"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (_, index) =>
                  ListTile(title: Text(activities[index].description)),
            ),
          ),
        ],
      ),
    );
  }
}
