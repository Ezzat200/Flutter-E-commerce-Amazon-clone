
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/SignIn_AuthScreen.dart';
import 'package:amazon_clone/view/widgets/bottom_authScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BodyAuthScreen extends StatelessWidget {
  const BodyAuthScreen({
    super.key,
  });

 

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView(
      
      children: [
        Container(
      height: height,
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Welcome', style: theme.textTheme.displayLarge),
            SizedBox(
              height: height * 0.02,
            ),



SignInAuthScreen(height: height, width: width),
        
      

           SizedBox(height: height *0.05,),
                  BottomAuthScreen(width: width, height: height)
          ],
        ),
      ),
    )
    
      ],
    );
    
      }
}
