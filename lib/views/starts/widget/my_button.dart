import 'package:dictionary_personalization/common/utilities/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final Function onTap;
  MyButton({required this.onTap, required this.height, required this.width, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextButton(
        child: Text(title, style: TextStyle(color: ColorConstant.buttonFiveColor)),
        onPressed: onTap(),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: ColorConstant.buttonFiveColor)
                  )
              )
          ),
      ),
    );
  }
}