
import 'package:amazon_clone/constants/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.width,
    required this.height,
    required  this.items,
     required this.imagePath,
      required this.boxFit,
  });

  final double width;
  final double height;
  final List<String> items;
  final String imagePath;
  final BoxFit boxFit;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
     
     items: items.map((i) {
     return Builder(builder: (BuildContext context){
       return Container(
         width: width,
         
         decoration: BoxDecoration(
           color: Colors.white,
           image: DecorationImage(image: AssetImage('${imagePath}${i}'),
           fit: boxFit
           ) 
         ),
       );
     });
              }).toList(), options: CarouselOptions(height: height*0.23,autoPlay: true,viewportFraction: 1));
  }
}
