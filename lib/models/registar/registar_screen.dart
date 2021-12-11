import 'package:flutter/material.dart';

class RegistarNow extends StatelessWidget {
  var EmailControl = TextEditingController();
  var PasswordControl = TextEditingController();
  var FirstName = TextEditingController();
  var LastName = TextEditingController();
  var RetearnPasswordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:

      Container(
        padding: const EdgeInsets.all(20.0),
        child:
        Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'register Now',style: TextStyle(fontSize:25.0,color: Colors.black,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: FirstName,
                  decoration:InputDecoration(hintText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  controller: LastName,
                  decoration: InputDecoration(hintText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                    controller: EmailControl,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                    InputDecoration(
                      labelText:'Email Adress' ,
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    )
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  controller: PasswordControl,
                  keyboardType:TextInputType.visiblePassword ,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  controller: RetearnPasswordControl,
                  keyboardType:TextInputType.visiblePassword ,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Return password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: MaterialButton(onPressed: (){
                    print(EmailControl.text);
                    print(PasswordControl);
                    print(FirstName.text);
                    print(LastName.text);
                    print(RetearnPasswordControl.text);
                  },

                    child: Text(
                      'register Now',style: TextStyle(color: Colors.white,fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You have account? '),
                    TextButton(onPressed: (){}, child: Text(
                      'Login',
                    ))
                  ],
                )
              ],

            ),

          ),
        ),
      ),
    );

  }
}
