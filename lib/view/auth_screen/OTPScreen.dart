import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/Custom_TextFromField.dart';
import 'package:amazon_clone/view/widgets/Custom_button.dart';
import 'package:amazon_clone/view/widgets/bottom_authScreen.dart';

import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileController = TextEditingController();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Image(
              image: const AssetImage('assets/images/amazon_splash_screen.png'),
              height: MediaQuery.of(context).size.width,
            )),
        body: ListView(
          children:[ Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Authentication rqeuired',
                  style: theme.textTheme.displayLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      '+201212527183',
                      style: theme.textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' change',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                Text(
                  ' We have sent a One Time Password (OTP) to the mobile number above. please enter it to complete vertification ',
                  style: theme.textTheme.displaySmall,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                    height: height * 0.08,
                    width: width * 0.95,
                    mobileController: mobileController,
                    hintText: 'Enter OTP'),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomButton(
                    width: width * 0.95, height: height * 0.06, text: 'Continue'),
                SizedBox(
                  height: height * 0.03,
                ),
                Center(
                  child: Text(
                    ' Resend OTP',
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: blue, fontWeight: FontWeight.bold),
                  ),
                ),
             SizedBox(height: height *0.05,),
          
                BottomAuthScreen(width: width, height: height)
          
              ],
            ),
          ),
        ]));
  }
}
