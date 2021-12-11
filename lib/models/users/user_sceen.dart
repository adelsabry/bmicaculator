import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(

            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount:10,
      ),
    );
  }

  Widget buildUserItem() => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(

          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('AdelSabry', style: TextStyle(fontSize: 20,color: Colors.black),),
            Text('phone',style: TextStyle(fontSize: 15),),
            Text('01093913242',style: TextStyle(fontSize: 15),),

          ],
        ),
      ],
    ),
  );

// 1. build item
// 2. build list
// 3. add item to list
}
