import 'package:bloc/bloc.dart';
import 'package:bmicaculator/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:bmicaculator/modules/done_tasks/done_tasks_screen.dart';
import 'package:bmicaculator/modules/new_tasks/new_tasks_screen.dart';
import 'package:bmicaculator/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

 static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles =
  [
    'Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];
  void ChageIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database database;
  List<Map> tasks = [];

  void creatdatbase()  {
    openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database, version) {
          print('db created');
          database
              .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
              .then((value) {
            print('table created');
          }).catchError((error) {
            print('ERROR when creating table ${error.toString()}');
          });
        }, onOpen: (database) {
          getDataFromDatabase(database).then((value) {
           tasks = value;
           print(tasks);
           emit(AppGetDatabase());
          }
          );
          print('database opened');
        },
        ).then((value){
          database = value;
          emit(AppCreateDatabase());
    });
  }

   insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async
  {
   await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$time", "$date", "new")'
      ).then((value)
      {
        print('$value inserted successfully');
        emit(AppInsertDatabase());

        getDataFromDatabase(database).then((value) {
          tasks = value;
          print(tasks);
          emit(AppGetDatabase());
        });
      }).catchError((error) {
        print('ERROR when inserting Nwe Record ${error.toString()}');
      }
      );
    }
    );
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  void ChangeBottomSheetState({
  required bool isShow,
    required IconData icon,
})
  {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }
}
