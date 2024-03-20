import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/Body_UserScreen.dart';
import 'package:amazon_clone/view/widgets/Custom_Hello_User.dart';
import 'package:amazon_clone/view/widgets/Custom_Navbar_UserScreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.09),
          child: NavbarUserScreen(width: width, height: height)),
      body: BodyUserScreen(width: width, height: height),
    ));
  }
}
