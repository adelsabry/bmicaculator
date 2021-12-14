import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function function,
  required String text,
  double radius = 0.0,

}) =>  Container(
  width: width,
  height: 40,
  child: FlatButton(
    onPressed: (){},
    child: Text(
      text.toUpperCase(),
      style: TextStyle(color: Colors.white),
    ),
  ),
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius),
    color:background,
  ),
);


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prfex,
  bool isPassword = false,
  IconData? suffix,
  Function()? suffixPressed,
  Function()? ontap,

}) =>TextFormField(
controller: controller,
keyboardType: type,
  onTap: ontap ,
  obscureText: isPassword,
decoration: InputDecoration(
labelText: label,
prefixIcon: Icon(prfex),
suffixIcon: suffix != null ? IconButton(
  onPressed: (){},
  icon:Icon(
      suffix
  ),
) :null,
border: OutlineInputBorder(),
),
);

Widget buildTaskItem(Map <dynamic , dynamic>tasks) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40,
        child: Text(
            '02:00 pm'
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Task Title',
            style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '2 april , 2021',
            style: TextStyle(
                color: Colors.grey
            ),
          ),
        ],
      ),
    ],
  ),
);