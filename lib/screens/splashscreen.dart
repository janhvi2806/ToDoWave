
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/screens/homescreen.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState(){
    super.initState();
    nav();
  }
  nav() async{
    await Future.delayed(const Duration(seconds: 3));
    Get.to(homeScreen());
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRect(child: Image.asset("images/TODO.jpg",height: 500, width: 500,),),
          Text("To Do List"),
        ],
      ),
    );
  }
}

