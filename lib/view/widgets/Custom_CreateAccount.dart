// ignore_for_file: sort_child_properties_last

import 'package:amazon_clone/controller/services/auth_services/auth_services.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/Custom_RitchText.dart';
import 'package:amazon_clone/view/widgets/Custom_TextFromField.dart';
import 'package:amazon_clone/view/widgets/Custom_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool inLogin = false;

  String currentCountryCode = '+91';

  TextEditingController mobileController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Builder(builder: (context) {
      if (inLogin) {
        return Container(
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
              color: greyShade3,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: width,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.01,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              inLogin = false;
                            });
                          },
                          child: Container(
                            height: height * 0.03,
                            width: height * 0.03,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: grey),
                                color: white),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.circle,
                              size: height * 0.015,
                              color: inLogin ? transparent : secondaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Create Account. ',
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'New to Amazon? ',
                                  style: textTheme.bodyMedium)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextField(
                        height: height * 0.07,
                        width: width * 0.9,
                        mobileController: mobileController,
                        hintText: 'First and Last Name'),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            showCountryPicker(
                                context: context,
                                onSelect: (val) {
                                  setState(() {
                                    currentCountryCode = '+${val.phoneCode}';
                                  });
                                });
                          },
                          child: Container(
                            height: height * 0.06,
                            width: width * 0.2,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: grey,
                              ),
                              color: greyShade2,
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            child: Text(
                              currentCountryCode,
                              style: textTheme.displaySmall!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        CustomTextField(
                            height: height * 0.06,
                            width: width * 0.65,
                            mobileController: mobileController,
                            hintText: 'Mobile Number')
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      'By enrolling your mobile phone number, you concent to receive automated security notifications via text message from Amazon.\nMessage and data rates may apply.',
                      style: textTheme.bodyMedium,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomButton(
                        ontap: () {
                          AuthServices.receiveOTP(
                              context: context,
                              mobileNo:
                                  '+$currentCountryCode${mobileController.text.trim()}');
                        },
                        child: Text(
                          'continue',
                          style: theme.textTheme.displaySmall,
                        ),
                        color: amber,
                        height: height * 0.07,
                        width: width * 0.9),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
              Container(
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: greyShade3),
                  ),
                  color: greyShade1,
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          inLogin = true;
                        });
                      },
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: grey),
                            color: white),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.015,
                          color: inLogin ? secondaryColor : transparent,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Create Account. ',
                              style: textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'New to Amazon? ',
                              style: textTheme.bodyMedium)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
      return Container(
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: greyShade3,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: height * 0.06,
              width: width,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: greyShade3),
                ),
                color: greyShade1,
              ),
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        inLogin = false;
                      });
                    },
                    child: Container(
                      height: height * 0.03,
                      width: height * 0.03,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: grey),
                          color: white),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.circle,
                        size: height * 0.015,
                        color: inLogin ? transparent : secondaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Sign In. ',
                            style: textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'New to Amazon? ',
                            style: textTheme.bodyMedium)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.01,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            inLogin = true;
                          });
                        },
                        child: Container(
                          height: height * 0.03,
                          width: height * 0.03,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: grey),
                              color: white),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.circle,
                            size: height * 0.015,
                            color: inLogin ? secondaryColor : transparent,
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Create Account. ',
                                style: textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: 'Alredy an account? ',
                                style: textTheme.bodyMedium)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              onSelect: (val) {
                                setState(() {
                                  currentCountryCode = '+${val.phoneCode}';
                                });
                              });
                        },
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: grey,
                            ),
                            color: greyShade2,
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          child: Text(
                            currentCountryCode,
                            style: textTheme.displaySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      CustomTextField(
                          height: height * 0.06,
                          width: width * 0.65,
                          mobileController: mobileController,
                          hintText: 'Mobile Number')
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomButton(
                    
                      ontap: () {
                        AuthServices.receiveOTP(
                            context: context,
                            mobileNo:
                                '$currentCountryCode${mobileController.text.trim()}');
                      },
                      child: Text(
                        'Continue',
                        style: theme.textTheme.displaySmall,
                        
                      ),
                      color: amber,
                      height: height * 0.07,
                      width: width * 0.9),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const RitchText(
                    text_1: 'By Continuing you agree to Amazon\'s ',
                    text_2: 'Conditions of use ',
                    text_3: 'and',
                    text_4: 'Privacy Notice',
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
