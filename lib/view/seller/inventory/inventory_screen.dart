import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/view/seller/add_products_screen/add_products_screen.dart';
import 'package:amazon_clone/view/widgets/Custom_Navbar_UserScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const AddProductsScreen(),
                    type: PageTransitionType.rightToLeft));
          },
          backgroundColor: amber,
          child: const Icon(Icons.add),
        ),
        appBar: PreferredSize(
            preferredSize: Size(width * 1, height * 0.09),
            child: NavbarUserScreen(width: width, height: height)),
        body: Container(),
      ),
    );
  }
}
