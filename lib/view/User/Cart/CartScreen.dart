// ignore_for_file: sort_child_properties_last

import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/CartListView.dart';
import 'package:amazon_clone/view/widgets/Custom_Diveder.dart';
import 'package:amazon_clone/view/widgets/Custom_Nav_Bar.dart';
import 'package:amazon_clone/view/widgets/Custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.08),
          child: CustomNavBar(width: width, height: height),
        ),
        body: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Subtotal ',
                      style: theme.textTheme.displayMedium!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '\$53,313',
                      style: theme.textTheme.displayLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: teal,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text:
                                      'Your Order is eligable for Free Delivery. ',
                                  style: theme.textTheme.bodySmall!
                                      .copyWith(color: teal)),
                              TextSpan(
                                  text:
                                      'Your Order is eligable for Free Delivery',
                                  style: theme.textTheme.bodySmall)
                            ]))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomButton(
                    child: Text(
                      'Proceed to Buy (2:items)',
                      style: theme.textTheme.displaySmall,
                    ),
                    // text: 'Proceed to Buy (2:items)',
                    height: height * 0.07,
                    width: width),
                SizedBox(
                  height: height * 0.02,
                ),
                const CustomDivider(),
                SizedBox(
                  height: height * 0.02,
                ),
                ////////////////////////////////
                CartListView(width: width, height: height)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
