import 'package:amazon_clone/controller/provider/deal_of_theDay_provider/deal_of_theday_provider.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/User/product_screen/product_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CustomCaroselDeals extends StatelessWidget {
  const CustomCaroselDeals({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Consumer<DealOfTheDayProvider>(
        builder: (context, dealOfTheDayProvider, child) {
      if (dealOfTheDayProvider.dealsFetched == false) {
        return Container(
          height: height * 0.02,
          width: width,
          alignment: Alignment.center,
          child: Text(
            'Loading lastest deals',
            style: theme.textTheme.bodyMedium,
          ),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
                items: dealOfTheDayProvider.deals.map((i) {
                  ProductModel currentProduc =i;
                      
                  return Builder(builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ProductScreen(
                                    productModel: currentProduc),
                                type: PageTransitionType.rightToLeft));
                      },
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(
                                    currentProduc.imagesURL![0]),
                                fit: BoxFit.contain)),
                      ),
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                    height: height * 0.23,
                    autoPlay: true,
                    viewportFraction: 1)),
                    const SizedBox(
                  height: 0.03,
                ),
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        margin: EdgeInsets.only(right: width * 0.03),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5), color: red),
                        child: Text(
                          'Up to 62% off',
                          style: theme.textTheme.labelMedium!
                              .copyWith(color: white),
                        )),
                    Text(
                      'Deal of the Day',
                      style: theme.textTheme.labelMedium!
                          .copyWith(fontWeight: FontWeight.bold, color: red),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
         itemCount: dealOfTheDayProvider.deals.length,
         gridDelegate:
      const  SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 4,
         mainAxisSpacing: 10,
         crossAxisSpacing: 20
         ),
         shrinkWrap: true, itemBuilder: (context,index){
          ProductModel currentModel = dealOfTheDayProvider.deals[index];
         return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children:[ Expanded(
             child: Container(
              
               decoration: BoxDecoration(
                 
                 image: DecorationImage(
                   fit: BoxFit.contain,
                   image:NetworkImage(
                     currentModel.imagesURL![0]
                      )
                   , ),
               ),
             ),
           ),
              
           ]
         );
       })
                
          ],
        );
      }
    });
  }
}
