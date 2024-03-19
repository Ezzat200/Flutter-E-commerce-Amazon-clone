import 'dart:developer';

import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/view/widgets/Custom_Nav_Bar.dart';
import 'package:amazon_clone/view/widgets/Custom_TextFromField.dart';
import 'package:amazon_clone/view/widgets/body_HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return  SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          
          preferredSize: Size(width*1, height*0.08), 
        
        child: CustomNavBar(width: width, height: height),
        
        ),
        body: const BodyHomeScreen()
      ),
    );
  }
}
