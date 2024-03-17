import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/auth_screen/auth_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AmazonApp());
}

class AmazonApp extends StatelessWidget {
  const AmazonApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home:const  AuthScreen(),
    );
  }
}