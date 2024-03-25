
import 'package:amazon_clone/utils/colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton( {
    
    this.ontap,  this.isloading=false,
    required this.height,
    required this.width,
    required this.child, required this.color
   });
   final bool isloading;
   final double height;
   final double width;
   final Widget child;
   final Color color;

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
          color: color,
          borderRadius: BorderRadius.circular(5),
              
        ),
              
        
       child: Center(
          child:child,
        ),
      ),
    );
  }
}