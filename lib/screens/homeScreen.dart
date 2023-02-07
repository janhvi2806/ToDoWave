import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:to_do_list/Constants.dart';
import 'package:to_do_list/Services/Databse.dart';

import 'package:to_do_list/Widgets/ToDoListTile.dart';
import 'package:to_do_list/Widgets/bottomSheet.dart';

import '../Widgets/textfieldWidget.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => homeScreenState();
}

class homeScreenState extends State<homeScreen> {
  void update() {
    homeScreen();
  }

  bool _isLoading = true;
  
  List<Map<String, dynamic>> _journals = [];

  List _todoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  getData() async {
    _todoList = await DatabaseHelper().queryDatabase();
    print(_todoList);
    setState(() {
      _isLoading = false;
    });
  }

  updateItem({required int id}) {}

  static List<tile> tileList = [];
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    void _showForm(int? id) async {
      btmSheet(id: null);
    }

    int n = _todoList.length;

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 4,
            title: Text(
              "To Do Wave",
              style: appBar,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
            ),
            backgroundColor: appBarColor,
          ),
          body: n > 0
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "You Have $n tasks pending",
                      style: style3,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _todoList.length,
                      itemBuilder: (context, index) => tile(
                        size: _size,
                        Date: _todoList[index]["date"],
                        des: _todoList[index]["description"],
                        id: _todoList[index]["id"],
                        title: _todoList[index]["title"],
                      ),
                    ),
                  ),
                ])
              : Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Let's Schedule some Tasks",style: style3,),
                      ClipRect(child: Image.asset("images/TODO.png",height: 500, width: 500,),),
                    ],
                  )),
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _showForm(null);
              });
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
