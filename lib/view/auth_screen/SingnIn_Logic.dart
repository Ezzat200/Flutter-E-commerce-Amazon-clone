// ignore_for_file: use_build_context_synchronously

import 'dart:developer';


import 'package:amazon_clone/controller/services/user_data_crud_services/user_data_Crud_services.dart';
import 'package:amazon_clone/view/User/user_data_screen/user_data_input_screen.dart';
import 'package:amazon_clone/view/User/user_presestant_nav_bar/user_bottom_nav_bar.dart';
import 'package:amazon_clone/view/auth_screen/auth_screens.dart';
import 'package:amazon_clone/view/seller/seller_presistant_nav_bar/seller_bootom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../controller/services/auth_services/auth_services.dart';


class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  checkUser() async {
    bool userAlreadyThere = await UserDataCRUD.checkUser();
    // log(userAlreadyThere.toString());
    if (userAlreadyThere == true) {
      bool userIsSeller = await UserDataCRUD.userIsSeller();
      log('start');
      log(userIsSeller.toString());
      if (userIsSeller == true) {
        Navigator.push(
          context,
          PageTransition(
            child: const SellerBootomNavBar(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      } else {
        Navigator.push(
          context,
          PageTransition(
            child: const UserBottomNavBar(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      }
    } else {
      Navigator.push(
        context,
        PageTransition(
          child: const UserDataInputScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    }
  }

  checkAuthentication() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();
    userIsAuthenticated
        ? checkUser()
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const AuthScreen(),
                type: PageTransitionType.rightToLeft),
            (route) => false);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAuthentication();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/images/amazon_splash_screen.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
