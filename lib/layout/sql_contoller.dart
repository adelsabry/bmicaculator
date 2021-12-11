import 'package:sqflite/sqflite.dart';

class SqlController {
  void creatDB() async {
    var db = await openDatabase('todo.db', version: 1, onCreate: (db, version) {
      print('db created');
      db
          .execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print('ERROR when creating table ${error.toString()}');
      });
    }, onOpen: (db) {
      print('db opened');
    });
  }
  void insertToDatabase()
  {

  }
}
