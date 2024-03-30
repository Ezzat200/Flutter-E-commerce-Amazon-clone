// ignore_for_file: sort_child_properties_last

import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/controller/services/product_services/product_services.dart';
import 'package:amazon_clone/controller/services/users_product_services/users_product_services.dart';
import 'package:amazon_clone/model/user_product_model.dart';
import 'package:amazon_clone/stripe_payment/payment_manager.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';

import 'package:amazon_clone/view/widgets/Custom_Diveder.dart';
import 'package:amazon_clone/view/widgets/Custom_Nav_Bar.dart';
import 'package:amazon_clone/view/widgets/Custom_button.dart';

import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void handlePaymentSuccess() async {
    List<UserProductModel> cartItems = await UsersProductService.fetchCart();
    DateTime currentTime = DateTime.now();

    for (var product in cartItems) {
      UserProductModel model = UserProductModel(
        imagesURL: product.imagesURL,
        name: product.name,
        category: product.category,
        description: product.description,
        brandName: product.brandName,
        manufacturerName: product.manufacturerName,
        countryOfOrigin: product.countryOfOrigin,
        specifications: product.specifications,
        price: product.price,
        discountedPrice: product.discountedPrice,
        productID: product.productID,
        productSellerID: product.productSellerID,
        inStock: product.inStock,
        discountPercentage: product.discountPercentage,
        productCount: product.productCount,
        time: currentTime,
      );
      await ProductServices.addSalesData(
        context: context,
        productModel: model,
        userID: auth.currentUser!.phoneNumber!,
      );
      await UsersProductService.addOrder(
        context: context,
        productModel: model,
      );
    }}
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
                StreamBuilder(
                    stream: UsersProductService.fetchCartProducts(),
                    builder: (context, snapshot) {
                      // if(snapshot.data!.isEmpty){
                      // return const Center(
                      //   child: Text('No Product Added To Cart'),
                      // );
                      // }
                      if (snapshot.hasData) {
                        List<UserProductModel> cartProduct = snapshot.data!;
                        

                        return Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Subtotal ',
                                  style: theme.textTheme.displayMedium!
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '\$ ${cartProduct.fold(0.0, (previousValue, element) => previousValue + (element.productCount! * element.discountedPrice!)).toStringAsFixed(0)}',
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
                                ontap: () async {
                                  PaymentManager.makePayment(
                                      cartProduct
                                          .fold(
                                              0.0,
                                              (previousValue, element) =>
                                                  previousValue +
                                                  (element.productCount! *
                                                      element.discountedPrice!))
                                          .toInt(),
                                      'USD');
                                      handlePaymentSuccess();
                                  // await ProductServices.addSalesData(
                                  //   context: context,
                                  //   productModel: cartProduct,
                                  //   userID: auth.currentUser!.phoneNumber!,
                                  // );
                                  // await UsersProductService.addOrder(
                                  //   context: context,
                                  //   productModel: model,
                                  // );
                                },
                                child: Text(
                                  'Proceed to Buy ',
                                  style: theme.textTheme.displaySmall,
                                ),
                                color: amber,
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
                            Container(
                              height: height * 0.6,
                              child: ListView.builder(
                                  itemCount: cartProduct.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    UserProductModel currenProduct =
                                        cartProduct[index];
                                    return Container(
                                      width: width,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.02,
                                          vertical: height * 0.01),
                                      margin: EdgeInsets.symmetric(
                                        vertical: height * 0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        color: greyShade1,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image(
                                                  image: NetworkImage(
                                                      currenProduct
                                                          .imagesURL![0]),
                                                  fit: BoxFit.contain,
                                                ),
                                                SizedBox(
                                                  height: height * 0.005,
                                                ),
                                                Container(
                                                  height: height * 0.06,
                                                  width: width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10,
                                                    ),
                                                    border: Border.all(
                                                      color: greyShade3,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                              height: double
                                                                  .infinity,
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border(
                                                                  right:
                                                                      BorderSide(
                                                                    color:
                                                                        greyShade3,
                                                                  ),
                                                                ),
                                                              ),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  if (currenProduct
                                                                          .productCount ==
                                                                      1) {
                                                                    await UsersProductService.removeProductfromCart(
                                                                        productId:
                                                                            currenProduct
                                                                                .productID!,
                                                                        context:
                                                                            context);
                                                                  }
                                                                  await UsersProductService.updateCountCartProduct(
                                                                      productId:
                                                                          currenProduct
                                                                              .productID!,
                                                                      newCount:
                                                                          currenProduct.productCount! -
                                                                              1,
                                                                      context:
                                                                          context);
                                                                },
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  color: black,
                                                                ),
                                                              ))),
                                                      Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            color: white,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                currenProduct
                                                                    .productCount
                                                                    .toString()),
                                                          )),
                                                      Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                              height: double
                                                                  .infinity,
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border(
                                                                  left:
                                                                      BorderSide(
                                                                    color:
                                                                        greyShade3,
                                                                  ),
                                                                ),
                                                              ),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  await UsersProductService.updateCountCartProduct(
                                                                      productId:
                                                                          currenProduct
                                                                              .productID!,
                                                                      newCount:
                                                                          currenProduct.productCount! +
                                                                              1,
                                                                      context:
                                                                          context);
                                                                },
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: black,
                                                                ),
                                                              )))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Expanded(
                                            flex: 9,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  currenProduct.name!,
                                                  maxLines: 3,
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                                SizedBox(
                                                  height: height * 0.005,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '\$${currenProduct.discountedPrice!.toStringAsFixed(0)}',
                                                      style: theme.textTheme
                                                          .displayMedium!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    Text(
                                                      ' M.R.P: ',
                                                      style: theme
                                                          .textTheme.bodySmall!
                                                          .copyWith(
                                                              color: grey),
                                                    ),
                                                    Text(
                                                      '\$${currenProduct.price!.toStringAsFixed(0)}',
                                                      style: theme
                                                          .textTheme.bodySmall!
                                                          .copyWith(
                                                              color: grey,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height * 0.005,
                                                ),
                                                Text(
                                                  currenProduct
                                                              .discountedPrice! >
                                                          499
                                                      ? 'Extra Delivery Charges Applied'
                                                      : 'Extra Delivery  Charges Applied',
                                                  style: theme
                                                      .textTheme.bodySmall!
                                                      .copyWith(color: grey),
                                                ),
                                                SizedBox(
                                                  height: height * 0.005,
                                                ),
                                                Text(
                                                  'In Stock',
                                                  style: theme
                                                      .textTheme.bodySmall!
                                                      .copyWith(color: teal),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ElevatedButton(
                                                        onPressed: () async {
                                                          await UsersProductService
                                                              .removeProductfromCart(
                                                                  productId:
                                                                      currenProduct
                                                                          .productID!,
                                                                  context:
                                                                      context);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              white,
                                                          side: BorderSide(
                                                            color: greyShade3,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'Delete',
                                                          style: theme.textTheme
                                                              .bodySmall,
                                                        )),
                                                    ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              white,
                                                          side: BorderSide(
                                                            color: greyShade3,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'Save for Later',
                                                          style: theme.textTheme
                                                              .bodySmall,
                                                        ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
                      }
                      if (snapshot.hasError) {
                        return const Text('oops! Error Found');
                      } else {
                        return const Text('oops! No Product Added To Cart');
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
