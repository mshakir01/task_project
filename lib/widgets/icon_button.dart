import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class IconBtn extends StatelessWidget {
  Function() onTap;
  final Icon? icon;

   IconBtn({super.key,required this.onTap,required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
           border: Border.all(color: kMainColor,width: 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                bottomRight: Radius.circular(17)
            )
        ),
        height: 50,
        width: 60,
        child: icon,
        ),
    );
  }
}
