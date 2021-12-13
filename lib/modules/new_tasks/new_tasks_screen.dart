import 'package:bmicaculator/shared/components/components.dart';
import 'package:bmicaculator/shared/components/constants.dart';
import 'package:flutter/material.dart';

class NewTasksScreen extends StatelessWidget
{


@override
  Widget build(BuildContext context) {

  var comp;
  return ListView.separated(itemBuilder: (context , index) =>
        comp.buildTaskItem(tasks[index]),
       separatorBuilder: (context , index) => Padding(
         padding: const EdgeInsetsDirectional.only(
           start: 20,
         ),
         child: Container(
           width:double.infinity,
           height: 1.0,
           color: Colors.grey[300],
         ),
       ),
       itemCount: tasks.length);
  }
}