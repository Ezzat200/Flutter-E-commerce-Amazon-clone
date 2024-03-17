
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/view/widgets/Custom_MobileNumber.dart';
import 'package:amazon_clone/view/widgets/Custom_RitchText.dart';
import 'package:amazon_clone/view/widgets/Custom_button.dart';
import 'package:amazon_clone/view/widgets/row_authScreen.dart';
import 'package:flutter/material.dart';

class SignInAuthScreen extends StatelessWidget {
  const SignInAuthScreen({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: greyShade3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const RowAuthScreen(),
          const CustomMobileNumber(),
          CustomButton(
            text: 'Continue',
          ),
          
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding:  EdgeInsets.all(width * 0.02),
            child: const CustomRitchText(
              text1: 'By countinuing you agree to Amazons',
              text2: 'Condition Of Use ',
              text3: 'and ',
              text4: 'Privacy Notice',
            ),
          ),
         
        ],
      ),
    );
  }
}
