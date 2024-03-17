



import 'package:amazon_clone/view/widgets/body_ScreenAuth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
 

    return  Scaffold(
      appBar:AppBar(
     backgroundColor: Colors.white,
     
   
        centerTitle: true,
        
        title: Image(image:const AssetImage('assets/images/amazon_splash_screen.png'),height: MediaQuery.of(context).size.width ,)
       
      ) ,
      body: const BodyAuthScreen()
    );
  }
}

