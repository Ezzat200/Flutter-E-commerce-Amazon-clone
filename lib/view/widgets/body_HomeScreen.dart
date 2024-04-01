import 'package:amazon_clone/constants/constants.dart';

import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/User/product_categories_screen/product_categories_screen.dart';
import 'package:amazon_clone/view/widgets/Custom_CaroselDeals.dart';
import 'package:amazon_clone/view/widgets/Custom_CarouselSlider.dart';
import 'package:amazon_clone/view/widgets/Custom_CategoryFashion.dart';
import 'package:amazon_clone/view/widgets/Custom_CategoryMobiles.dart';
import 'package:amazon_clone/view/widgets/Custom_CategoryTv.dart';
import 'package:amazon_clone/view/widgets/Custom_Diveder.dart';

import 'package:amazon_clone/view/widgets/Custom_Text_Button.dart';
import 'package:amazon_clone/view/widgets/Custom_categoryElctronics.dart';
import 'package:amazon_clone/view/widgets/Home_Screen_User_AddressBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';


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
        HomeScreenUserAddressBar(height: height, width: width),
        const CustomDivider(),
        Container(
      height: height*0.1,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
      itemBuilder: (context,index){
         return GestureDetector(
          onTap: () {
          Navigator.push(context,PageTransition(child: ProductCategoriesScreen(category:categories[index] ,), type: PageTransitionType.rightToLeft));
          },
           child: Container(
                 margin:EdgeInsets.symmetric(horizontal: width*0.008) ,
             child: Column(
               
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                       Image(
                        image: AssetImage('assets/images/categories/${categories[index]}.png'
                        ),
                        height: width*0.07
                      ), 
                      Text( categories[index],style: theme.textTheme.labelMedium,)
              ],
             ),
           ),
         );
      }),
    ),
        SizedBox(
          height: height * 0.02,
        ),
        const CustomDivider(),

        CustomCarouselSlider(
            items: carouselPictures,
            boxFit: BoxFit.cover,
            imagePath: 'assets/images/carousel_slideshow/',
            width: width,
            height: height),
        Container(
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '50%-80% off | Latest Sale',
                  style: theme.textTheme.displaySmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                CustomCaroselDeals(height: height, width: width),
                
                const CustomTextButton(
                  text: 'See all Deals',
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        const CustomDivider(),
        SizedBox(
          height: height * 0.01,
        ),
CustomCategoryElctronics(
    category: 'Electronics',
    width: width, height: height),
           

        
        const CustomDivider(),
       CustomCategoryMobiles(width: width, height: height, category: 'Mobiles'),
        
        SizedBox(
          height: height * 0.01,
        ),
        const CustomDivider(),
        SizedBox(
          height: height * 0.01,
        ),



CustomCategoryFashion(
  category: 'Fashion',
  width: width, height: height),     

        const CustomDivider(),
        SizedBox(
          height: height * 0.01,
        ),

        Padding(
          padding: EdgeInsets.only(left: width * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Watch Sixer Only On miniTv',
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),

       CustomCategoryTV(width: width, height: height, category: 'miniTV')
      ]),
    );
  }
}
