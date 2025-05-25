import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const tableName = 'Reminders';
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;
  DbHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'reminder.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await _db?.execute('''
          CREATE TABLE $tableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          description TEXT,
          isActive INTEGER,
          remindersTime TEXT,
          category TEXT
          ''');
  }

  static Future<List<Map<String, dynamic>>?> getReminders() async {
    return await _db?.query(tableName);
  }

  static Future<Map<String, dynamic>?> getReminderById(int id) async {
    final result = await _db?.query(tableName, where: 'id = ?', whereArgs: [id]);

    if (result!.isNotEmpty) return result.first;

    return null;
  }

  static Future<int?> addReminder(Map<String, dynamic> reminder) async {
    return await _db?.insert(tableName, reminder);
  }

  static Future<void> updateReminder(int id, Map<String, dynamic> reminder) async {
    await _db?.update(tableName, reminder, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> deleteReminder(int id) async {
    await _db?.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> toggleReminder(int id, bool isActive) async {
    await _db?.update(tableName, {'isActive' : isActive ? 1 : 0}, where: 'id = ?', whereArgs: [id]);
  }
}
