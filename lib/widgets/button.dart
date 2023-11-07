import 'package:authtemplate/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants/text_style.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool showCircularBar;
  const MyButton(
      {super.key,
      required this.text,
      this.onTap,
      this.showCircularBar = false});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child:  Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color:kMainColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            )
        ),
        height: 20,
        width: 70,
        child: Text(text,style: hintStyle.copyWith(color: Colors.white),),
      ),
    );
  }
}