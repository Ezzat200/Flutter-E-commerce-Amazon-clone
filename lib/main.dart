
import 'package:amazon_clone/controller/provider/address_provider.dart';
import 'package:amazon_clone/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon_clone/controller/provider/deal_of_theDay_provider/deal_of_theday_provider.dart';
import 'package:amazon_clone/controller/provider/product_by_category_provider/product_by_category_provider.dart';
import 'package:amazon_clone/controller/provider/product_provider/product_provider.dart';
import 'package:amazon_clone/controller/provider/users_product_provider/users_product_provider.dart';
import 'package:amazon_clone/firebase_options.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/User/adress_Screen/adress_Screen.dart';
import 'package:amazon_clone/view/User/user_data_screen/user_data_input_screen.dart';
import 'package:amazon_clone/view/User/user_presestant_nav_bar/user_bottom_nav_bar.dart';
import 'package:amazon_clone/view/auth_screen/SingnIn_Logic.dart';
import 'package:amazon_clone/view/seller/add_products_screen/add_products_screen.dart';
import 'package:amazon_clone/view/seller/seller_presistant_nav_bar/seller_bootom_navbar.dart';


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
           ChangeNotifierProvider<AutthProvider>(create: (_)=>AutthProvider()),
           ChangeNotifierProvider<AddressProvider>(create: (_)=>AddressProvider()),
           ChangeNotifierProvider<SellerProductProvider>(create: (_)=>SellerProductProvider()),
           ChangeNotifierProvider<UsersProductProvider>(create: (_)=>UsersProductProvider()),
           ChangeNotifierProvider<DealOfTheDayProvider>(create: (_)=>DealOfTheDayProvider()),
           ChangeNotifierProvider<ProductsBasedOnCategoryProvider>(create: (_)=>ProductsBasedOnCategoryProvider()),
          
      ],
    
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home:  const SignInLogic()
        // home:const UserBottomNavBar(),
        // home: const UserDataInputScreen(),
        // home: const AdressScreen(),
        // home: const SellerBootomNavBar(),
        // home: const AddProductsScreen(),
      ),
    );
  }

  
}
