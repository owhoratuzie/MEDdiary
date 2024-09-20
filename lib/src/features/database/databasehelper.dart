import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'health_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE blood_pressure (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        systolic INTEGER,
        diastolic INTEGER,
        date TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE blood_glucose (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        glucose_level INTEGER,
        unit TEXT,
        date TEXT
      )
    ''');
  }

  // Insert blood pressure
  Future<int> insertBloodPressure(
      int systolic, int diastolic, String date) async {
    final db = await database;
    return await db.insert('blood_pressure', {
      'systolic': systolic,
      'diastolic': diastolic,
      'date': date,
    });
  }

  // Insert blood glucose
  Future<int> insertBloodGlucose(
      int glucoseLevel, String unit, String date) async {
    final db = await database;
    return await db.insert('blood_glucose', {
      'glucose_level': glucoseLevel,
      'unit': unit,
      'date': date,
    });
  }

  // Retrieve all blood pressure records
  Future<List<Map<String, dynamic>>> getAllBloodPressure() async {
    final db = await database;
    return await db.query('blood_pressure');
  }

  // Retrieve all blood glucose records
  Future<List<Map<String, dynamic>>> getAllBloodGlucose() async {
    final db = await database;
    return await db.query('blood_glucose');
  }
}
