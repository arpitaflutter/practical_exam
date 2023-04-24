import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/sharedPreference.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({Key? key}) : super(key: key);

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up Screen"),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: txtemail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("email:- ")),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtpass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("password:- ")),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    onPressed: () {
                      String email = txtemail.text;
                      String pass = txtpass.text;

                      Shr shr = Shr();
                      shr.create(email, pass);

                      Get.toNamed('taskme');
                    },
                    child: Text("Sign Up")),
                SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {
                      Get.snackbar('Already have an Account', 'Sign In');
                      Get.toNamed('signin');
                    },
                    child: Text(
                      "You have already an Account!! SignIn",
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
