import 'package:sqflite/sqflite.dart';
import '../model/task_data.dart';
class DatabaseHelper {
static const _databaseName = "todo.db";
static const _databaseVersion = 1;
static const table = "todo";
static const columnId = 'id';
static const columnTitle = 'title';
DatabaseHelper._privateConstructor();
static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
static late Database _database;
Future<Database> get database async {
 //if (_database != null) return _database;
 _database = await _initDatabase();
 return _database;
}
_initDatabase() async {
 return await openDatabase(
 _databaseName,
 version: _databaseVersion,
 onCreate: _onCreate
 );
}
Future _onCreate(Database db, int version) async {
 await db.execute('''
 CREATE TABLE $table (
 $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
 $columnTitle FLOAT NOT NULL
 )
 ''');
}
Future<int> insert(TaskData todo) async {
 Database db = await instance.database;
 var res = await db.insert(table, todo.toMap());
 return res;
}
Future<List<Map<String, dynamic>>> queryAllRows() async {
 Database db = await instance.database;
 var res = await db.query(table, orderBy: "$columnId DESC");
 return res;
}
Future<int> delete(int id) async {
 Database db = await instance.database;
 return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
}
Future<void> clearTable() async {
 Database db = await instance.database;
 await db.rawQuery("DELETE FROM $table");
 }
 Future<int> updateItem(TaskData todo) async {
 Database db = await instance.database;
 final result =
 await db.update(
 table,
 todo.toMap(),
 // Ensure that the todo has a matching id.
 where: 'id = ?',
 // Pass the todo's id as a whereArg to prevent SQL injection.
 whereArgs: [todo.id],
 );

 return result;

 } 

} 