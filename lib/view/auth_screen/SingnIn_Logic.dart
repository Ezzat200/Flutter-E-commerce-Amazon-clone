// ignore_for_file: use_build_context_synchronously

import 'package:amazon_clone/controller/services/auth_services/auth_services.dart';
import 'package:amazon_clone/controller/services/user_data_crud_services/user_data_Crud_services.dart';
import 'package:amazon_clone/view/User/user_data_screen/user_data_input_screen.dart';
import 'package:amazon_clone/view/User/user_presestant_nav_bar/user_bottom_nav_bar.dart';
import 'package:amazon_clone/view/auth_screen/auth_screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SigninLogic extends StatefulWidget {
  const SigninLogic({super.key});

  @override
  State<SigninLogic> createState() => _SigninLogicState();
}

class _SigninLogicState extends State<SigninLogic> {
  checkUsre() async {
    bool userAlreadyThere = await UserDataCRUD.checkUser();
    if (userAlreadyThere ==true ) {
      Navigator.push(
        context,
        PageTransition(
          child: const UserBottomNavBar(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    } else{
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
    bool userIsAuthentication = AuthServices.checkAuthentication();
    userIsAuthentication
        ? checkUsre()
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const AuthScreen(),
                type: PageTransitionType.leftToRight),
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
