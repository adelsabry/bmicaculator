import 'package:bloc/bloc.dart';
import 'package:bmicaculator/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:bmicaculator/modules/done_tasks/done_tasks_screen.dart';
import 'package:bmicaculator/modules/new_tasks/new_tasks_screen.dart';
import 'package:bmicaculator/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
}
