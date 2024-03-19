
import 'package:amazon_clone/view/widgets/Custom_CreateAccount.dart';
import 'package:amazon_clone/view/widgets/bottom_authScreen.dart';
import 'package:flutter/material.dart';

class BodyAuthScreen extends StatelessWidget {
  const BodyAuthScreen({
    super.key,
    required this.height,
    required this.width,
    required this.textTheme,
    required this.inLogin
  });

  final double height;
  final double width;
  final TextTheme textTheme;
  final bool inLogin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: textTheme.displaySmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
           
            SizedBox(height:height * 0.02),
            
    
           CreateAccount(),
            
            SizedBox(height: height * 0.05,),
             BottomAuthScreen(width: width*0.9, height: 2)
          ],
        ),
      ),
    );
  
  }
}