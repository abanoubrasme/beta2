import 'package:sqflite/sqflite.dart';

class SqlDB {

  createDB()async{
    String dbPath = await getDatabasesPath();
  }

}