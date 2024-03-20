
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.height,
    required this.width,
     required this.imagePath,
  });

  final double height;
  final double width;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: height*0.35,
                   width: width,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(imagePath))
                  
                  ),
                  
                );
  }
}