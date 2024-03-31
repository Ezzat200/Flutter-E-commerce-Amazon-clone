import 'dart:developer';

import 'package:amazon_clone/controller/provider/product_by_category_provider/product_by_category_provider.dart';
import 'package:amazon_clone/controller/provider/product_provider/product_provider.dart';
import 'package:amazon_clone/controller/provider/users_product_provider/users_product_provider.dart';
import 'package:amazon_clone/controller/services/product_services/product_services.dart';
import 'package:amazon_clone/controller/services/users_product_services/users_product_services.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/model/user_product_model.dart';
import 'package:amazon_clone/stripe_payment/payment_manager.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/User/product_screen/product_screen.dart';
import 'package:amazon_clone/view/widgets/Custom_Rating.dart';
import 'package:amazon_clone/view/widgets/Custom_button.dart';

import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class BuyAgainScreen extends StatefulWidget {
  const BuyAgainScreen({super.key, });

  @override
  State<BuyAgainScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<BuyAgainScreen> {
  final TextEditingController searchController = TextEditingController();

  getDay(int dayNum) {
    switch (dayNum % 7) {
      case 0:
        return 'Monday';
      case 1:
        return 'Tuesday';
      case 2:
        return 'Wednesday';
      case 3:
        return 'Thursday';
      case 4:
        return 'Friday';
      case 5:
        return 'Saturday';
      case 6:
        return 'Sunday';
      default:
        'Sunday';
    }
  }

  getMonth(int deliveryDate) {
    if (DateTime.now().month == 2) {
      if (deliveryDate > 28) {
        return 'March';
      } else {
        return 'Febuary';
      }
    }
    if (DateTime.now().month == 4 ||
        DateTime.now().month == 6 ||
        DateTime.now().month == 8 ||
        DateTime.now().month == 10 ||
        DateTime.now().month == 12) {
      if ((deliveryDate > 30) && (DateTime.now().month == 12)) {
        return 'January';
      }
      if (deliveryDate > 30) {
        int month = DateTime.now().month + 1;
        switch (month) {
          case 1:
            return 'January';

          case 2:
            return 'February';

          case 3:
            return 'March';

          case 4:
            return 'April';

          case 5:
            return 'May';

          case 6:
            return 'June';

          case 7:
            return 'July';

          case 8:
            return 'August';

          case 9:
            return 'September';

          case 10:
            return 'October';

          case 11:
            return 'November';
          case 12:
            return 'December';
        }
      } else {
        int month = DateTime.now().month;
        switch (month) {
          case 1:
            return 'January';

          case 2:
            return 'February';

          case 3:
            return 'March';

          case 4:
            return 'April';

          case 5:
            return 'May';

          case 6:
            return 'June';

          case 7:
            return 'July';

          case 8:
            return 'August';

          case 9:
            return 'September';

          case 10:
            return 'October';

          case 11:
            return 'November';
          case 12:
            return 'December';
        }
      }
    }
    log(DateTime.now().month.toString());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
context.read<SellerProductProvider>().fecthSellerProducts();});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(width * 1, height * 0.1),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03, vertical: height * 0.005),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: appBarGradientColor,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                ),
               child:  Row(
            children: [
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: black,
                        )),
                   
                   
                  ],
                ),
              Image(
                image: const AssetImage(
                  'assets/images/amazon_black_logo.png',
                ),
                height: height * 0.04,
              ),
              const Spacer(),
              
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: black,
                  size: height * 0.035,
                ),
              ),
            ],
          ),
                
              ),
              ),
         
          body: Consumer<SellerProductProvider>(
              builder: (context, sellerProductProvider, child) {
            if (sellerProductProvider.sellerProductsFetched == false) {
              return Center(
                child: CircularProgressIndicator(
                  color: amber,
                ),
              );
            } else if (sellerProductProvider.products.isEmpty) {
              return const Center(
                child: Text('oops! product not found'),
              );
            } else {
              return ListView.builder(
                  itemCount: sellerProductProvider.products.length,
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  itemBuilder: (context, index) {
                   ProductModel currentModel =
                            sellerProductProvider.products[index];
                      return StreamBuilder( stream: ProductServices.fetchSalesPerProduct(
                                productID: currentModel.productID!),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.isEmpty) {
                                  return SizedBox();
                                }else{
                                  return 
                                  InkWell(
                      onTap: () async {
                        
                        Navigator.push(
                            context,
                            PageTransition(
                                child:
                                    ProductScreen(productModel: currentModel),
                                type: PageTransitionType.rightToLeft));
                      },
                      child: Container(
                        height: height * 0.45,
                        width: width,
                        margin: EdgeInsets.symmetric(
                          horizontal: width * 0.03,
                          vertical: height * 0.007,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: greyShade3),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  color: greyShade1,
                                  child: Image.network(
                                    currentModel.imagesURL![0],
                                    fit: BoxFit.fitWidth,
                                  ),
                                )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.02,
                                      vertical: height * 0.03),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentModel.name ?? '',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodySmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: height * 0.005,
                                      ),
                                      CustomRating(
                                          width: width, height: height),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text.rich(
                                        maxLines: 2,
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: '\$',
                                                style:
                                                    theme.textTheme.bodyMedium),
                                            TextSpan(
                                              text: currentModel
                                                  .discountedPrice!
                                                  .toStringAsFixed(0),
                                              style: theme.textTheme.bodyLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            TextSpan(
                                                text: '\tMRP: ',
                                                style:
                                                    theme.textTheme.bodyMedium),
                                            TextSpan(
                                                text:
                                                    '\$${currentModel.price!.toStringAsFixed(0)}',
                                                style: theme
                                                    .textTheme.labelLarge!
                                                    .copyWith(
                                                        color: grey,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough)),
                                            TextSpan(
                                                text:
                                                    '\t(${currentModel.discountPercentage!.toStringAsFixed(0)}% off )',
                                                style: theme
                                                    .textTheme.labelMedium!
                                                    .copyWith(
                                                  color: grey,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Text('Save extra With No Cost EMI',
                                          style: theme.textTheme.labelMedium!
                                              .copyWith(
                                            color: grey,
                                          )),
                                      Text.rich(
                                        maxLines: 2,
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Get it by ',
                                              style: theme
                                                  .textTheme.labelMedium!
                                                  .copyWith(
                                                color: grey,
                                              ),
                                            ),
                                            TextSpan(
                                              text: getDay(
                                                  DateTime.now().weekday + 3),
                                              style: theme
                                                  .textTheme.labelMedium!
                                                  .copyWith(
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            TextSpan(
                                              text:
                                                  ', ${DateTime.now().day + 3} ',
                                              style: theme
                                                  .textTheme.labelMedium!
                                                  .copyWith(
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            TextSpan(
                                              text: getMonth(
                                                  DateTime.now().month),
                                              style: theme
                                                  .textTheme.labelMedium!
                                                  .copyWith(
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        currentModel.discountedPrice! > 500
                                            ? 'FREE Delivery by Amazon'
                                            : 'Extra Delivery charges Applied',
                                        style: theme.textTheme.labelMedium!
                                            .copyWith(color: grey),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                     CustomButton(
                ontap: () {
                  PaymentManager.makePayment(
                     currentModel.discountedPrice!.toInt(),
                     'USD');     
                                                    
                },
                color: orange,
                height: height * 0.06,
                width: width,
                child: Text(
                  'Buy Now',
                  style: theme.textTheme.displayLarge!.copyWith(
                    color: black,
                  ),
                ),
              ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                 
                                }
                                }
if (snapshot.hasError) {
                                return Text(
                                  'Opps! Error Loading Data, Please contact Admin',
                                  style: theme.textTheme.bodyMedium,
                                );
                              } else {
                                return SizedBox();
                              }
                                });
                    
                  });
            }
          })),
    );
  }
}
