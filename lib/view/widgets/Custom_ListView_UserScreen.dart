
import 'package:amazon_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomListViewUserScreen extends StatelessWidget {
  const CustomListViewUserScreen({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  height*0.17,
    
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
    physics:const PageScrollPhysics(),
        itemBuilder: (context,index){
          return Container(
    width: width*0.4,
    height: height*0.17,
    margin: EdgeInsets.symmetric(horizontal: width*0.02),
    decoration: BoxDecoration(border: Border.all(  color: greyShade3 ),
    borderRadius: BorderRadius.circular(10)),
          );
        }),
    );
  }
}
