import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/Custom_Diveder.dart';
import 'package:amazon_clone/view/widgets/Custom_GridView_UserScreen.dart';
import 'package:amazon_clone/view/widgets/Custom_Hello_User.dart';
import 'package:amazon_clone/view/widgets/Custom_ListView_UserScreen.dart';
import 'package:amazon_clone/view/widgets/Custom_Text_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                  GridView.builder(
                      itemCount: 5,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.9),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: greyShade2,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: grey),
                                ),
                              ),
                            ),
                            const Text('product')
                          ],
                        );
                      })
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              child: Column(
                children: [ Row(
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
                  CustomListViewUserScreen(height: height, width: width),],
              ),
            )
          ],
        ),
      ),
    );
  }
}
