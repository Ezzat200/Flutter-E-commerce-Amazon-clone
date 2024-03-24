
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton( {
    // required this.text,
    this.ontap,  this.isloading=false,
    required this.height,
    required this.width,
    required this.child
   });
   final bool isloading;
   final double height;
   final double width;
   final Widget child;

// final String text;
final VoidCallback?ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: ontap,

      child: Container(
        
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: amber,
          borderRadius: BorderRadius.circular(5),
              
        ),
              
        
       child: Center(
          child:child,
        ),
      ),
    );
  }
}