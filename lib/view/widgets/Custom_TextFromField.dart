
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.height,
    required this.width,
    required this.mobileController,
     required this.hintText,
  });

  final double height;
  final double width;
  final TextEditingController mobileController;
  final String hintText;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ,
      child: TextFormField(
        controller: mobileController,
        cursorColor: black,
        style: theme.textTheme.bodySmall,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: grey)),
    
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: grey)),
    
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: secondaryColor))),
      ),
    );
  }
}
