import 'package:amazon_clone/utils/colors.dart';

import 'package:amazon_clone/view/widgets/CategoriesListView.dart';
import 'package:amazon_clone/view/widgets/Custom_Diveder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: height * 0.06,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: addressBarGradientColor),
          ),
        ),
       const CustomDivider(),
        CategoriesListView(height: height, width: width),
        SizedBox(height: height*0.02,),
        const CustomDivider(),
        Container(
          // child: CarouselSlider(items: items, options: options),
        )
      ]),
    );
  }
}
