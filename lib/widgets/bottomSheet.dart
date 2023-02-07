import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/Screens/homeScreen.dart';
import 'package:to_do_list/Services/Databse.dart';
import 'package:to_do_list/Widgets/textfieldWidget.dart';

class btmSheet {
  btmSheet({
    int? id,
    String? title,
    String? des,
    String? Date,
  }) {
    TextEditingController _dateController = TextEditingController();
    TextEditingController _title = TextEditingController();
    TextEditingController _description = TextEditingController();
    if (id != null) {
      _dateController.text = Date.toString();
      _title.text = title.toString();
      _description.text = title.toString();
    }
    Get.bottomSheet(
        isDismissible: true,
        elevation: 2,
        Container(
          height: Get.height * 0.5,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                txtField(
                  controller: _title,
                ),
                txtField2(controller: _description),
                Row(
                  children: [
                    txtField3(
                      controller: _dateController,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.back();
                          if (id == null) {
                            DatabaseHelper.ins(_title.text, _description.text,
                                _dateController.text);

                                
                          } else {
                            DatabaseHelper().update({
                              "id": "$id",
                              "title": _title.text,
                              "description": _description.text,
                              "date": _dateController.text
                            });
                          }
                            Get.offAll(homeScreen(),duration: Duration(seconds: 0));
                        },
                        child: id == null ? Text("Add") : Text("Update")),
                  ],
                )
              ]),
        ));
  }
}
