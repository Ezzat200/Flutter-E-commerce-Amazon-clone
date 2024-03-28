import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/User/product_categories_screen/product_categories_screen.dart';
import 'package:amazon_clone/view/widgets/CategoriesListView.dart';
import 'package:amazon_clone/view/widgets/Custom_CaroselDeals.dart';
import 'package:amazon_clone/view/widgets/Custom_CarouselSlider.dart';
import 'package:amazon_clone/view/widgets/Custom_Diveder.dart';
import 'package:amazon_clone/view/widgets/Custom_GridView.dart';
import 'package:amazon_clone/view/widgets/Custom_Image.dart';
import 'package:amazon_clone/view/widgets/Custom_Text_Button.dart';
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

        Container(
          width: width,
          padding: EdgeInsets.symmetric(
              vertical: height * 0.01, horizontal: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Latest lunches',
                style: theme.textTheme.displayLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              CustomGridView(
                crossAxisCount: 2,
                imagePath: 'assets/images/offersNsponcered/',
                items: headphonesDeals,
                boxFit: BoxFit.cover,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const CustomTextButton(text: 'Explor More'),
            ],
          ),
        ),
        const CustomDivider(),
        CustomImage(
          height: height,
          width: width,
          imagePath: 'assets/images/offersNsponcered/insurance.png',
        ),
        //////////////
        SizedBox(
          height: height * 0.01,
        ),
        const CustomDivider(),
        SizedBox(
          height: height * 0.01,
        ),

        Container(
          width: width,
          padding: EdgeInsets.symmetric(
              vertical: height * 0.01, horizontal: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Minimum 70% off | Top Offers on Clothing',
                style: theme.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              CustomGridView(
                crossAxisCount: 2,
                imagePath: 'assets/images/offersNsponcered/',
                items: clothingDealsList,
                boxFit: BoxFit.cover,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const CustomTextButton(text: 'See all Deals'),
            ],
          ),
        ),
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

        CustomImage(
          height: height,
          width: width,
          imagePath: 'assets/images/offersNsponcered/sixer.png',
        ),
      ]),
    );
  }
}
