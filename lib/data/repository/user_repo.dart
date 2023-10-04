import 'package:sqflite/sqflite.dart';

class UserRepo{
  Future<void> createtable(Database? db) async{
    await db?.execute(" CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,email TEXT,mobile INTEGER)");
  }

  Future<void> getUsers(Database? db) async{
    final List<Map<String,dynamic>> maps = await db!.query('users');
    print(maps);

  }
}