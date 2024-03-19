// ignore_for_file: use_build_context_synchronously

import 'dart:developer';


import 'package:amazon_clone/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon_clone/view/auth_screen/OTPScreen.dart';
import 'package:amazon_clone/view/auth_screen/SingnIn_Logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';



class AuthServices {
  static bool checkAuthentication() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  static receiveOTP(
      {required BuildContext context, required String mobileNo}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNo,
        verificationCompleted: (PhoneAuthCredential credential) {
          log(credential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
        },
        codeSent: (String verificationID, int? resendToken) {
          context
              .read<AutthProvider>()
              .upDateverificationId(verID: verificationID);
          context.read<AutthProvider>().upDatePhoneNum(
                num: mobileNo,
              );
             
           Navigator.push(
          context,
          PageTransition(
            child:  OTPScreen(mobileNumber: mobileNo,),
            type: PageTransitionType.rightToLeft,
          ));
         
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static verifyOTP({required BuildContext context, required String otp}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<AutthProvider >().verificationId,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      
      Navigator.push(
          context,
          PageTransition(
            child: const SigninLogic(),
            type: PageTransitionType.rightToLeft,
          ));
    } catch (e) {
      log(e.toString());
    }
  }
}
