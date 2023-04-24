import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/sharedPreference.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign in Screen"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: txtemail,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("email:- ")),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtpass,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("password:- ")),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var useremail = txtemail.text;
                      var userpass = txtpass.text;

                      Shr shr = Shr();
                      Map m1 = await shr.read();

                      if (useremail == m1['e1'] && userpass == m1['p1']) {
                        Get.toNamed('taskme');
                      } else {
                       Get.snackbar('Invalid email or password', 'enter the email or password');
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    child: Text("Sign In")),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Get.snackbar('You dont have an Account?', 'Sign Up');
                      Get.toNamed('signUp');
                    },
                    child: Text(
                      "You don't have an Account? SignUp",
                      style: TextStyle(color: Colors.teal.shade800),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
