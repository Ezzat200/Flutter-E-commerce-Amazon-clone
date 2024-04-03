// ignore_for_file: sort_child_properties_last

import 'package:amazon_clone/controller/services/auth_services/auth_services.dart';
import 'package:amazon_clone/utils/theme.dart';

import 'package:amazon_clone/view/widgets/Custom_TextFromField.dart';
import 'package:amazon_clone/view/widgets/Custom_button.dart';
import 'package:amazon_clone/view/widgets/bottom_authScreen.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.mobileNumber});
 final String mobileNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/images/amazon_splash_screen.png'),
          height: height * 0.5,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
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
                  'Authentication Required',
                  style: textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.mobileNumber,
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' Change',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'We have send a One Time Password (OTP) to the mobile no. above. Please enter it to complete verification.',
                  style: textTheme.bodyMedium,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                    height: height * 0.06,
                    width: width * 0.9,
                    mobileController: otpController,
                    hintText: 'Enter OTP'),
                SizedBox(
                  height: height * 0.01,
                ),
                CustomButton(
                    ontap: () {
                      AuthServices.verifyOTP(
                        context: context,
                        otp: otpController.text.trim(),
                      );
                    },
                    child: Text(
                      'Verify',
                      style: theme.textTheme.displaySmall,
                    ),
                    color: amber,
                    height: height * 0.06,
                    width: width * 0.9),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend OTP',
                        style: textTheme.bodyMedium!.copyWith(
                          color: blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                BottomAuthScreen(width: width, height: height)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
