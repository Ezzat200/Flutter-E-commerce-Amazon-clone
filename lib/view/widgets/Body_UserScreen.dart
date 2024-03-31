import 'package:amazon_clone/controller/provider/product_provider/product_provider.dart';
import 'package:amazon_clone/controller/services/product_services/product_services.dart';
import 'package:amazon_clone/controller/services/users_product_services/users_product_services.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/model/user_product_model.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/User/product_screen/product_screen.dart';
import 'package:amazon_clone/view/widgets/Custom_Diveder.dart';
import 'package:amazon_clone/view/widgets/Custom_GridView_UserScreen.dart';
import 'package:amazon_clone/view/widgets/Custom_Hello_User.dart';
import 'package:amazon_clone/view/widgets/Custom_Text_Button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class BodyUserScreen extends StatefulWidget {
  const BodyUserScreen({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  State<BodyUserScreen> createState() => _BodyUserScreenState();
}

class _BodyUserScreenState extends State<BodyUserScreen> {
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SellerProductProvider>().fecthSellerProducts();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: widget.width,
        padding: EdgeInsets.symmetric(vertical: widget.height * 0.03),
        child: Column(
          children: [
            CustomHelloUser(width: widget.width),
            SizedBox(height: widget.height * 0.01),
            StreamBuilder<List<UserProductModel>>(
                stream: UsersProductService.fetchOrders(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Container(
                          height: widget.height * 0.02,
                          width: widget.width,
                          alignment: Alignment.center,
                          child: Text(
                            'Your didnt order anything  yet',
                            style: theme.textTheme.displayMedium,
                          ));
                    } else {
                      List<UserProductModel> orders=snapshot.data!;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widget.width * 0.04, vertical: widget.height * 0.02),
                        child: Column(
                          children: [
                            CustomGridViewUserScreen(width: widget.width),
                            SizedBox(height: widget.height * 0.01),
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
                            Container(
                              height: widget.height * 0.17,
                              child: ListView.builder(
                                  itemCount: orders.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const PageScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    UserProductModel currentproduct = orders[index];
                                    return GestureDetector(
                                      onTap: () {
                                        ProductModel product = ProductModel(
                                      imagesURL: currentproduct.imagesURL,
                                      name: currentproduct.name,
                                      category: currentproduct.category,
                                      description: currentproduct.description,
                                      brandName: currentproduct.brandName,
                                      manufacturerName:
                                          currentproduct.manufacturerName,
                                      countryOfOrigin:
                                          currentproduct.countryOfOrigin,
                                      specifications:
                                          currentproduct.specifications,
                                      price: currentproduct.price,
                                      discountedPrice:
                                          currentproduct.discountedPrice,
                                      productID: currentproduct.productID,
                                      productSellerID:
                                          currentproduct.productSellerID,
                                      inStock: currentproduct.inStock,
                                      uploadedAt: currentproduct.time,
                                      discountPercentage:
                                          currentproduct.discountPercentage);

                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child:
                                          ProductScreen(productModel: product),
                                      type: PageTransitionType.rightToLeft,
                                    ),
                                  );
                                      },
                                      child: Container(
                                        width: widget.width * 0.4,
                                        height: widget.height * 0.17,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: widget.width * 0.02),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: greyShade3),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                                child: Image(image: NetworkImage(currentproduct.imagesURL![0]),fit: BoxFit.contain,),
                                      ),
                                    );
                                    
                                  }),
                            )
                          ],
                        ),
                      );
                    }
                  }else{
                     
                      return Container(
                          height: widget.height * 0.02,
                          width: widget.width,
                          alignment: Alignment.center,
                          child: Text(
                            'Your didnt order anything  yet',
                            style: theme.textTheme.displayMedium,
                          ));
                  }
                }),
          
            SizedBox(height: widget.height * 0.01),
            const CustomDivider(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widget.width * 0.04, vertical: widget.height * 0.02),
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
                          width: widget.width,
                          height: widget.height,
                          alignment: Alignment.center,
                          child: const Text('There Was an Error'),
                        );
                      } else {
                        return Container(
                          width: widget.width,
                          height: widget.height,
                          alignment: Alignment.center,
                          child: const Text('No Product Found'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),

                    
                     
Consumer<SellerProductProvider>(
                builder: (context, sellerProductProvider, child) {
                  if (sellerProductProvider.sellerProductsFetched == false) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (sellerProductProvider.products.isEmpty) {
                    return Center(
                      child: Text(
                        'No Products Found',
                        style: theme.textTheme.bodyMedium,
                      ),
                    );
                  }
                   
                      
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widget.width * 0.04, vertical: widget.height * 0.02),
                        child: Column(
                          children: [
                           
                            SizedBox(height: widget.height * 0.01),
                            Row(
                              children: [
                                Text(
                                  'Buy Again',
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                const CustomTextButton(text: 'See all')
                              ],
                            ),
                            Container(
                              height: widget.height * 0.17,
                              child: ListView.builder(
                                  itemCount: sellerProductProvider.products.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
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
                                }
                                else{
                                  

                                    return GestureDetector(
                                      onTap: () {
                                        ProductModel product = ProductModel(
                                      imagesURL: currentModel.imagesURL,
                                      name: currentModel.name,
                                      category: currentModel.category,
                                      description: currentModel.description,
                                      brandName: currentModel.brandName,
                                      manufacturerName:
                                          currentModel.manufacturerName,
                                      countryOfOrigin:
                                          currentModel.countryOfOrigin,
                                      specifications:
                                          currentModel.specifications,
                                      price: currentModel.price,
                                      discountedPrice:
                                          currentModel.discountedPrice,
                                      productID: currentModel.productID,
                                      productSellerID:
                                          currentModel.productSellerID,
                                      inStock: currentModel.inStock,
                                      uploadedAt: currentModel.uploadedAt,
                                      discountPercentage:
                                          currentModel.discountPercentage);

                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child:
                                          ProductScreen(productModel: product),
                                      type: PageTransitionType.rightToLeft,
                                    ),
                                  );
                                      },
                                      child: Container(
                                        width: widget.width * 0.4,
                                        height: widget.height * 0.17,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: widget.width * 0.02),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: greyShade3),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                                child: Image(image: NetworkImage(currentModel.imagesURL![0]),fit: BoxFit.contain,),
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
                                }
                                
                                
                                );
                                  
                                  }
                                  ),
                            )
                          ],
                        ),
                      );
                    
                  }
                  
                ),]),),);}
}
  

