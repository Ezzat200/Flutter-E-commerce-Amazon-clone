
import 'package:amazon_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class NavbarUserScreen extends StatelessWidget {
  const NavbarUserScreen({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
          
          padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.015 ),
          decoration: BoxDecoration(gradient: LinearGradient(colors: appBarGradientColor,
          begin: Alignment.centerLeft, end:Alignment.centerRight),
          ),
          child: Row(
            children: 
            [
    Container(
      padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical:height* 0.008),
      child: Image(image:const AssetImage('assets/images/amazon_black_logo.png'),height: height*0.04,),
      
    ),
             const Spacer(),
            IconButton(onPressed: (){}, icon:  Icon(Icons.notifications_outlined,size: height*0.035,),),
            IconButton(onPressed: (){}, icon:  Icon(Icons.search,size: height*0.035))
    
            ],
    
          ),
        );
  }
}