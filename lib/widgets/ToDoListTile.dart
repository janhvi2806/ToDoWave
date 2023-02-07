import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/Constants.dart';
import 'package:to_do_list/Screens/homeScreen.dart';
import 'package:to_do_list/Services/Databse.dart';
import 'package:to_do_list/Widgets/bottomSheet.dart';

class tile extends StatelessWidget {
  int id;
  String des;
  final Size size;
  String title;
  String Date;
  tile(
      {super.key,
      required this.size,
      required this.title,
      required this.Date,
      required this.des,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          btmSheet(id: id,title: title,des: des,Date: Date);
        },
        child: Material(
          elevation: 3,
          child: Container(
            width: size.width * 0.85,
            height: size.height * 0.12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue[900],
                border: Border.all(width: 1, color: Colors.black38)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: style1),
                      Text(Date, style: style2),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        DatabaseHelper().deleteRecored(id);
                        Get.offAll(homeScreen(),
                            duration: Duration(seconds: 0));
                      },
                      icon: Icon(Icons.remove_circle_outline_outlined))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
