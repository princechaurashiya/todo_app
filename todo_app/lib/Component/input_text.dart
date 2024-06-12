import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  String h_text;
  var controllers;
  InputText({super.key, required this.h_text, required this.controllers});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 45,
      width: screenWidth * 0.8,
      child: TextFormField(
          controller: widget.controllers,
          decoration: InputDecoration(
            hintText: widget.h_text,
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 108, 76, 212)),
                borderRadius: BorderRadius.circular(22)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(22)),
          )),
    );
  }
}
