import 'package:bmicaculator/shared/components/components.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formKey,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                      label: 'Email',
                    prfex: Icons.email,
                    type: TextInputType.emailAddress,
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    label: 'password',
                    prfex: Icons.email,
                    type: TextInputType.visiblePassword,
                    isPassword: isPassword,
                    suffix: isPassword ? Icons.visibility :Icons.visibility_off,
                    suffixPressed: ()
                    {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    radius: 10,
                    width: double.infinity,
                    background: Colors.red,
                    text: 'login',
                    function: ()
                    {
                      if(formKey.currentState!.validate()){
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account?',
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Register Now',
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
