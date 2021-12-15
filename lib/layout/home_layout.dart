import 'package:bmicaculator/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:bmicaculator/modules/done_tasks/done_tasks_screen.dart';
import 'package:bmicaculator/modules/new_tasks/new_tasks_screen.dart';
import 'package:bmicaculator/shared/components/components.dart';
import 'package:bmicaculator/shared/components/constants.dart';
import 'package:bmicaculator/shared/cubit/cubit.dart';
import 'package:bmicaculator/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

//1. create database
//2. create tables
//3. open database
//4. insert to database
//5. get from database
//6. update in database
//7. delete from database

class HomeLayout extends StatelessWidget {

  var scaffoldkey = GlobalKey<ScaffoldState>();
    var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context) => AppCubit()..creatdatbase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener:(context ,state){
          if (state is AppInsertDatabase)
          {
            Navigator.pop(context);
          };
        },
        builder: (context , state){
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(onPressed: ()
            {
              if (cubit.isBottomSheetShown) {
                cubit.insertToDatabase(title:
                titleController.text,
                    time: timeController.text,
                    date:dateController.text
                );
              } else {
                scaffoldkey.currentState!
                    .showBottomSheet(
                      (context) => Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultFormField(
                          controller: titleController,
                          type: TextInputType.text,
                          label: 'Task Tiltle',
                          prfex: Icons.title,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: timeController,
                          type: TextInputType.datetime,
                          ontap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              timeController.text =
                                  value!.format(context).toString();
                            });
                          },
                          label: 'Task Time',
                          prfex: Icons.watch_later_outlined,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: dateController,
                          type: TextInputType.datetime,
                          ontap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse('2022-05-03'),
                            ).then((value) {
                              dateController.text =
                                  DateFormat.yMMMMd().format(value!);
                            });
                          },
                          label: 'Task Date',
                          prfex: Icons.calendar_today,
                        ),
                      ],
                    ),
                  ),
                  elevation: 15,
                ).closed.then((value) {
                      cubit.ChangeBottomSheetState(
                          isShow: false,
                          icon: Icons.edit);
                });
                      cubit.ChangeBottomSheetState(
                          isShow: true,
                          icon:Icons.add);
              };
              Icon(
                cubit.fabIcon,
              );
            }),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (index) {
                cubit.ChageIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archived'),
              ],
            ),
          );
        },
      ),
    );
  }
}

