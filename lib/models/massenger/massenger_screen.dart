import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MassengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(children: [
          CircleAvatar(radius: 20.0,backgroundImage:NetworkImage('https://f.top4top.io/p_2139sbg0k1.jpg'),

          ),
          SizedBox(
            width: 15,
          ),
          Text('Chat',style: TextStyle(fontSize: 20,color: Colors.black),)
        ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: CircleAvatar(
              radius: 15.0,backgroundColor:Colors.blue ,
              child:
              Icon(Icons.camera_alt,size:15 ,color: Colors.white,))),
          IconButton(onPressed: (){}, icon: CircleAvatar(
              radius: 15.0,backgroundColor:Colors.blue ,
              child:
              Icon(Icons.edit,size:15 ,color: Colors.white,)))

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(children: [
                  Icon(Icons.search),
                  SizedBox(width: 15.0,),
                  Text('Search'),
                ],),
              ),
              SizedBox(height: 15,),
              Container(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => buildStorItem(),
                  separatorBuilder: (context,index) => SizedBox(width: 10,),
                  itemCount: 10,
                ),
              ),
              SizedBox(height: 15,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatIteam(),
                separatorBuilder: (context, index) => SizedBox(height: 20,),
                itemCount:15 ,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildChatIteam() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children:[
          CircleAvatar(radius: 20,
            backgroundImage: NetworkImage(
                'https://f.top4top.io/p_2139sbg0k1.jpg'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3),
            child: CircleAvatar(radius: 7,backgroundColor: Colors.red,),
          ),
        ],
      ),
      SizedBox(width: 20,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('AdelSabry',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold )),
            SizedBox(height:5 ,),
            Row(
              children: [
                Expanded
                  (child: Text(
                  'hello my name is adel sabry',
                  maxLines: 2,overflow: TextOverflow.ellipsis,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,

                    ),
                  ),
                ),
                Text('02:00 pm'),
              ],
            )
          ],
        ),
      )
    ],
  );
  Widget buildStorItem() => Container(
    width: 40,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:[
            CircleAvatar(radius: 20,
              backgroundImage: NetworkImage(
                  'https://f.top4top.io/p_2139sbg0k1.jpg'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  bottom: 3,
                  end: 3),
              child: CircleAvatar(radius: 7,backgroundColor: Colors.red,),
            ),
          ],
        ),
        SizedBox(height: 6,),
        Text('Adel Sabry',maxLines: 2,overflow: TextOverflow.ellipsis,),
      ],
    ),
  );
}


