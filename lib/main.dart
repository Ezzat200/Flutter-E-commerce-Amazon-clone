
import 'package:amazon_clone/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon_clone/firebase_options.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/auth_screen/SingnIn_Logic.dart';

import 'package:amazon_clone/view/auth_screen/auth_screens.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AmazonApp());
}

class AmazonApp extends StatelessWidget {
  const AmazonApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
                 ChangeNotifierProvider<AutthProvider>(create: (_)=>AutthProvider())
      ],
    
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home:  const SigninLogic()
      ),
    );
  }

  
}
