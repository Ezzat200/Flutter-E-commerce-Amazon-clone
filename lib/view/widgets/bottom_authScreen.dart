
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:flutter/material.dart';

class BottomAuthScreen extends StatelessWidget {
  const BottomAuthScreen({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [white ,white,grey,grey,white,white])
          ),
          
        ),
               SizedBox(height: height *0.02,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('Condition Of Use',style: theme.textTheme.bodyMedium!.copyWith(color: blue),),
                Text('Privacy Notice',style: theme.textTheme.bodyMedium!.copyWith(color: blue),),
                Text('help',style: theme.textTheme.bodyMedium!.copyWith(color: blue),),
                ],
                
               ),
               SizedBox(height: height * 0.01,),
               Text('Ⓒ 1996-2024,Amazon.com,inc affiliates ',style: theme.textTheme.labelMedium!.copyWith(color: grey),)
        
      ],
    );
  }
}
