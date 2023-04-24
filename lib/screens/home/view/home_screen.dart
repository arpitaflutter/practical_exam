import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                Get.toNamed('signin');
              }, child: Text("Log in Screen")),
              ElevatedButton(onPressed: () {
                Get.toNamed('');
              }, child: Text("Patern Screen")),
              ElevatedButton(onPressed: () {
                Get.toNamed('api');
              }, child: Text("Api Screen"))
            ],
          ),
        ),
      ),
    );
  }
}
