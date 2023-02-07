import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO DO LIST',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: splashScreen()
    );
  }
}