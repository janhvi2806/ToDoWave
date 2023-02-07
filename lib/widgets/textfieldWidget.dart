import 'package:flutter/material.dart';

class txtField extends StatelessWidget {

  TextEditingController controller;
  txtField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration.collapsed(hintText: "Title"),
          ),
        ),
      ),
    );
  }
}

class txtField2 extends StatelessWidget {

TextEditingController controller;
  txtField2({super.key, required this.controller});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description"),
          Container(
            height: 160,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: ""),
                controller: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class txtField3 extends StatefulWidget {
  txtField3({super.key ,required this.controller});
  TextEditingController controller;
  @override
  State<txtField3> createState() => _txtField3State();
}

class _txtField3State extends State<txtField3> {
  DateTime _dt = DateTime.now();



  @override
  Widget build(BuildContext context) {
    _showDatePicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(_dt.year + 1))
          .then((value) {
        setState(() {
          String _dtn = value!.day.toString() +
              "-" +
              value.month.toString() +
              "-" +
              value.year.toString() +
              "  ";
          widget.controller.text = _dtn;
        });
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            onTap: () {
              _showDatePicker();
            },
            readOnly: true,
            controller: widget.controller,
            decoration: InputDecoration.collapsed(hintText: "Date"),
          ),
        ),
      ),
    );
  }
}
