

import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/CategoriesListView.dart';
import 'package:amazon_clone/view/widgets/Custom_CarouselSlider.dart';
import 'package:amazon_clone/view/widgets/Custom_Diveder.dart';
import 'package:amazon_clone/view/widgets/Custom_GridView.dart';
import 'package:amazon_clone/view/widgets/Custom_Image.dart';
import 'package:amazon_clone/view/widgets/Custom_Text_Button.dart';
import 'package:amazon_clone/view/widgets/Home_Screen_User_AddressBar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        CategoriesListView(height: height, width: width),
        SizedBox(height: height*0.02,),
        const CustomDivider(),
        
           CustomCarouselSlider(
            items:  carouselPictures,
            boxFit: BoxFit.cover,
            imagePath: 'assets/images/carousel_slideshow/',
            width: width, height: height),
            Container(
              width: width,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical:height*0.01,horizontal: width*0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('50%-80% off | Latest Sale',style: theme.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w600),),
                  CustomCarouselSlider(
                    imagePath: 'assets/images/todays_deals/',
                    boxFit: BoxFit.fitHeight,
                    width: width, height:height*0.8, items:todaysDeals ),
                   const SizedBox(height: 0.03,),
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: EdgeInsets.only(right: width*0.03),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: red),
                        child: Text('Up to 62% off',style: theme.textTheme.labelMedium!.copyWith(color: white),)),
                        Text('Deal of the Day',style: theme.textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold ,color: red),),
                                                
                    ],
                    ),
                    SizedBox(height: height*0.03,),
                      CustomGridView(crossAxisCount: 4,
                     imagePath: 'assets/images/todays_deals/',
                     items: todaysDeals,
                     boxFit: BoxFit.cover,
                     

                     ),

     const  CustomTextButton(text: 'See all Deals',)
                  ],
                ),
              ),
            ),
       SizedBox(height: height*0.01,),
       const CustomDivider(),
       SizedBox(height: height*0.01,),

       Container(
        width: width,
         padding:  EdgeInsets.symmetric(vertical:height*0.01,horizontal: width*0.03),
child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Latest lunches',style: theme.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),),

    CustomGridView(crossAxisCount: 2,
    imagePath: 'assets/images/offersNsponcered/',
                         items: headphonesDeals,
                         boxFit: BoxFit.cover,
                         ),
                    SizedBox(height: height*0.03,),
                 const   CustomTextButton(text: 'Explor More'),
                   
  ],
),
       ),
       const CustomDivider(),
        CustomImage(height: height, width: width,imagePath: 'assets/images/offersNsponcered/insurance.png',),
        //////////////
         SizedBox(height: height*0.01,),
       const CustomDivider(),
       SizedBox(height: height*0.01,),

       Container(
        width: width,
         padding:  EdgeInsets.symmetric(vertical:height*0.01,horizontal: width*0.03),
child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Minimum 70% off | Top Offers on Clothing',style: theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),),

    CustomGridView(crossAxisCount: 2,
    imagePath: 'assets/images/offersNsponcered/',
                         items: clothingDealsList,
                         boxFit: BoxFit.cover,
                         ),
                    SizedBox(height: height*0.03,),
                 const   CustomTextButton(text: 'See all Deals'),
                   
  ],
),
       ),
       const CustomDivider(),
       SizedBox(height: height*0.01,),

    Padding(
      padding:  EdgeInsets.only(left: width*0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Watch Sixer Only On miniTv',style:theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
        ],
      ),
    ),
       SizedBox(height: height*0.01,),

        CustomImage(height: height, width: width,imagePath: 'assets/images/offersNsponcered/sixer.png',),
      ]),
    );
  }
}


