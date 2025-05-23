import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_application_laboratorio_3/models/activity.dart';

class ActivityDatabase {
  static Future<Database> _openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'activity.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE activities(id INTEGER PRIMARY KEY, description TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertActivity(Activity activity) async {
    final db = await _openDB();
    await db.insert('activities', activity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Activity>> getActivities() async {
    final db = await _openDB();
    final List<Map<String, dynamic>> maps = await db.query('activities');
    return List.generate(maps.length, (i) {
      return Activity.fromMap(maps[i]);
    });
  }
}
