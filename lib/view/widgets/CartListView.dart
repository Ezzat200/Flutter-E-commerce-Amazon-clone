
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            // height: height * 0.3,
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(
                            'assets/images/todays_deals/todaysDeal1.png'),
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Container(
                        height: height * 0.06,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
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
                                    height: double.infinity,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: greyShade3,
                                        ),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: black,
                                    ))),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  color: white,
                                  alignment: Alignment.center,
                                  child: Text('1'),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: greyShade3,
                                        ),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: black,
                                    )))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex:9 ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product name',
                       
                        style: theme.textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$46499',
                            style: theme.textTheme.displayMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(
                        'Extra Delivery Charges Applied',
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: grey),
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(
                        'In Stock',
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: teal),
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: white,
                                side: BorderSide(
                                  color: greyShade3,
                                ),
                              ),
                              child: Text(
                                'Delete',
                                style: theme.textTheme.bodySmall,
                              )),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: white,
                                side: BorderSide(
                                  color: greyShade3,
                                ),
                              ),
                              child: Text(
                                'Save for Later',
                                style: theme.textTheme.bodySmall,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
