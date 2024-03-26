import 'package:amazon_clone/controller/services/users_product_services/users_product_services.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/User/product_screen/product_screen.dart';
import 'package:amazon_clone/view/widgets/Custom_Diveder.dart';
import 'package:amazon_clone/view/widgets/Custom_GridView_UserScreen.dart';
import 'package:amazon_clone/view/widgets/Custom_Hello_User.dart';
import 'package:amazon_clone/view/widgets/Custom_ListView_UserScreen.dart';
import 'package:amazon_clone/view/widgets/Custom_Text_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

class BodyUserScreen extends StatelessWidget {
  const BodyUserScreen({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: height * 0.03),
        child: Column(
          children: [
            CustomHelloUser(width: width),
            SizedBox(height: height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              child: Column(
                children: [
                  CustomGridViewUserScreen(width: width),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      Text(
                        'Your Orders',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const CustomTextButton(text: 'See all')
                    ],
                  ),
                  CustomListViewUserScreen(height: height, width: width),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            const CustomDivider(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Keep Shoping for',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const CustomTextButton(text: 'Browsing history')
                    ],
                  ),
                  StreamBuilder(
                    stream: UsersProductService.fetchKeepShoppingForProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<ProductModel> products = snapshot.data!;
                        return GridView.builder(
                            itemCount:
                                products.length > 6 ? 6 : products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.9),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              ProductModel currentProduct = products[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: ProductScreen(
                                              productModel: currentProduct),
                                          type:
                                              PageTransitionType.rightToLeft));
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: greyShade2,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(color: grey),
                                        ),
                                        child: Image.network(
                                          currentProduct.imagesURL![0],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Text(
                                        maxLines: 2,
                                        currentProduct.name!,
                                        style: theme.textTheme.labelLarge)
                                  ],
                                ),
                              );
                            });
                      }
                      if (snapshot.hasError) {
                        return Container(
                          width: width,
                          height: height,
                          alignment: Alignment.center,
                          child: const Text('There Was an Error'),
                        );
                      } else {
                        return Container(
                          width: width,
                          height: height,
                          alignment: Alignment.center,
                          child: const Text('No Product Found'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Buy Again ',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const CustomTextButton(text: 'See all')
                    ],
                  ),
                  CustomListViewUserScreen(height: height, width: width),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
