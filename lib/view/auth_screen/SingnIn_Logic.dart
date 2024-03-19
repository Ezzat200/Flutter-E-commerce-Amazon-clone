import 'package:amazon_clone/controller/services/auth_services/auth_services.dart';
import 'package:amazon_clone/view/User/Home/Home_Screen.dart';
import 'package:amazon_clone/view/auth_screen/auth_screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SigninLogic extends StatefulWidget {
  const SigninLogic({super.key});

  @override
  State<SigninLogic> createState() => _SigninLogicState();
}

class _SigninLogicState extends State<SigninLogic> {
  checkAuthentication() {
    bool userIsAuthentication = AuthServices.checkAuthentication();
    userIsAuthentication
        ? Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: HomeScreen(), type: PageTransitionType.leftToRight),
            (route) => false)
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
