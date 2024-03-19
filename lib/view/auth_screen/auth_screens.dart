

// import 'package:amazon_clone/view/widgets/body_ScreenAuth.dart';
// import 'package:flutter/material.dart';

// class AuthScreen extends StatelessWidget {
//   const AuthScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
 

//     return  Scaffold(
//       appBar:AppBar(
//      backgroundColor: Colors.white,
     
   
//         centerTitle: true,
        
//         title: Image(image:const AssetImage('assets/images/amazon_splash_screen.png'),height: MediaQuery.of(context).size.width ,)
       
//       ) ,
//       body: const BodyAuthScreen()
//     );
//   }
// }

import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/view/widgets/body_AuthScreen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  String currentCountryCode = '+91';
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/images/amazon_splash_screen.png'),
          height: height * 0.5,
        ),
      ),
      body: SafeArea(
        child: BodyAuthScreen(height: height, width: width, textTheme: textTheme, inLogin: inLogin),
      ),
    );
  }
}
