import 'package:amazon_clone/controller/provider/product_provider/product_provider.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/seller/add_products_screen/add_products_screen.dart';
import 'package:amazon_clone/view/widgets/Custom_CaroselNetWork.dart';
import 'package:amazon_clone/view/widgets/Custom_Navbar_UserScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SellerProductProvider>().fecthSellerProducts();
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const AddProductsScreen(),
                    type: PageTransitionType.rightToLeft));
          },
          backgroundColor: amber,
          child: const Icon(Icons.add),
        ),
        appBar: PreferredSize(
            preferredSize: Size(width * 1, height * 0.09),
            child: NavbarUserScreen(width: width, height: height)),
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
              child: SingleChildScrollView(
                child: Column(
                children: [
                 Consumer<SellerProductProvider>(
                      builder: (context, sellerProductProvider, child) {
                    if (sellerProductProvider.sellerProductsFetched == false) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } 
                    else if (sellerProductProvider.products.isEmpty) {
                      return Center(
                        child: Text(
                          'No Products Found',
                          style: theme.textTheme.bodyMedium,
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: sellerProductProvider.products.length,
                        shrinkWrap: true,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context, index) {
                          ProductModel currentModel =
                              sellerProductProvider.products[index];
                          return Container(
                            height: height * 0.4,
                            width: width,
                            margin: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.02,
                                vertical: height * 0.01),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              border: Border.all(
                                color: grey,
                              ),
                            ),
                            child: Column(
                              children: [
                                CaroselNetWork(height: height, currentModel: currentModel),
                        const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            currentModel.name!,
                                            style:theme.textTheme.bodyMedium!.copyWith(
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            currentModel.description!,
                                            
                                            maxLines: 2,
                                            style: theme.textTheme.bodySmall!.copyWith(
                                                overflow: TextOverflow.ellipsis,
                                                color: grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: width*0.02,),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                           Text(
                                            '\$ ${currentModel.discountPercentage.toString()}',
                                            style:theme.textTheme.labelMedium!
                                                .copyWith(
                                                    color: grey,
                                                   ),
                                          ),
                                          Text(
                                            '\$ ${currentModel.price.toString()}',
                                            style:theme.textTheme.labelMedium!
                                                .copyWith(
                                                    color: grey,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                          ),
                                          Text(
                                            currentModel.inStock!
                                                ? 'in Stock'
                                                : 'Out of Stock',
                                            style:theme.textTheme.bodySmall!.copyWith(
                                                color: currentModel.inStock!
                                                    ? teal
                                                    : red),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                             
                              ],
                            ),
                          );
                        });
                  })
                  ],
                ),
              ),
              
        ),
      ),
    );
  }
}
