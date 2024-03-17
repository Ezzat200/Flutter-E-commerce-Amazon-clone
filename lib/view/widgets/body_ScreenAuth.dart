

import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/row_authScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BodyAuthScreen extends StatelessWidget {
const   BodyAuthScreen({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
final width = MediaQuery.of(context).size.width;
final height = MediaQuery.of(context).size.height;

    return  SafeArea(
      child: Container(
        height: height,
        width: width,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:width *0.03 ,vertical:height*0.02 ),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Welcome',style:theme.textTheme.displayLarge),
            SizedBox(height: height * 0.02,),
           Container(
            decoration: BoxDecoration(border: Border.all(color: greyShade3)),
             child:  RowAuthScreen()
           ),
                 
                  
          ],
                  ),
        ),
      ),
    );
  }
}

