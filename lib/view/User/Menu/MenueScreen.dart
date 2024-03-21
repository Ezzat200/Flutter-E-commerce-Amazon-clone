
import 'package:amazon_clone/view/widgets/Body_MenueScreen.dart';
import 'package:amazon_clone/view/widgets/Custom_Nav_Bar.dart';
import 'package:flutter/material.dart';

class MenueScreen extends StatelessWidget {
  const MenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width * 1, height * 0.08),
        child: CustomNavBar(width: width, height: height),
      ),
      body: BodyMenueScreen(width: width, height: height),
    
    );
  }
}
