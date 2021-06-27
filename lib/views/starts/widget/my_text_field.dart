
import 'package:dictionary_personalization/common/utilities/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labText;
  MyTextField({required this.labText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labText,
          labelStyle: TextStyle(color: ColorConstant.textColor),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConstant.textColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConstant.textColor),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConstant.textColor),
          ),
        ),
      ),
    );
  }
}