// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/model/user_model.dart';
import 'package:amazon_clone/view/auth_screen/SingnIn_Logic.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class UserDtatCrud{
static addNewUser({required UserModel userModel,required BuildContext context})async{
try {
  await firestore.collection('users').doc(auth.currentUser!.phoneNumber).set(userModel.toMap()).whenComplete(() {
  log('Data added successfully');
   showToast(context: context, message: 'Data added successfully');

 Navigator.pushAndRemoveUntil(context, PageTransition(child: const SigninLogic(), type: PageTransitionType.rightToLeft), (route) => false);
  });
} catch (e) {
  log(e.toString());
showToast(context: context, message: e.toString());

}

}
static Future<bool> checkUser()async{
  bool userPresnt =false;
try {
  await firestore.collection('users').where('mobileNum').get().then((value) => {
value.size > 0? userPresnt= true:userPresnt= false
  });
} catch (e) {
  log(e.toString());
}
log(userPresnt.toString());
return userPresnt;
  
}
}