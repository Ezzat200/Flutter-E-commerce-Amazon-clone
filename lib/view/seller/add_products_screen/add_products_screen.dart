// ignore_for_file: use_build_context_synchronously, sort_child_properties_last

import 'dart:io';

import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/controller/provider/product_provider/product_provider.dart';
import 'package:amazon_clone/controller/services/product_services/product_services.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/Custom_button.dart';

import 'package:amazon_clone/view/widgets/Product_Details_TextField.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController manufacturerNameController = TextEditingController();
  TextEditingController countryOfOriginController = TextEditingController();
  TextEditingController productSpecificationsController =
      TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController discountedProductPriceController =
      TextEditingController();
  String dropDownValue = 'Select Category';
  bool addproductBtnPress = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        addproductBtnPress = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(width * 1, height * 0.09),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.015),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: appBarGradientColor,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: width * 0.03, vertical: height * 0.008),
                  //   child: Image(
                  //     image: const AssetImage(
                  //         'assets/images/amazon_black_logo.png'),
                  //     height: height * 0.04,
                  //   ),
                  // ),
                  Text(
                    'Add Product',
                    style: theme.textTheme.displayMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
        body: ListView(children: [
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.02),
            child: Column(
              children: [
                Consumer<SellerProductProvider>(
                    builder: (context, productProvider, child) {
                  return Builder(builder: (context) {
                    if (productProvider.productImages.isEmpty) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<SellerProductProvider>()
                              .fetchProductImagesFromGallery(context: context);
                        },
                        child: Container(
                          height: height * 0.3,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: greyShade3),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: height * 0.09,
                                color: greyShade3,
                              ),
                              Text(
                                'Add Product',
                                style: theme.textTheme.displayMedium!
                                    .copyWith(color: greyShade3),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      List<File> images =
                          context.read<SellerProductProvider>().productImages;
                      return CarouselSlider(
                          items: images.map((i) {
                            return Builder(builder: (BuildContext context) {
                              return Container(
                                width: width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: FileImage(File(i.path)),
                                        fit: BoxFit.contain)),
                              );
                            });
                          }).toList(),
                          options: CarouselOptions(
                              height: height * 0.23,
                              autoPlay: true,
                              viewportFraction: 1));
                    }
                  });
                }),
                SizedBox(
                  height: height * 0.02,
                ),
                Column(
                  children: [
                    AddProductTextField(
                        title: 'Product Name',
                        hintText: 'Name',
                        textController: productNameController),
                    AddProductTextField(
                        title: 'product Description ',
                        hintText: 'Description',
                        textController: productDescriptionController),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Category',
                          style: theme.textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          height: height * 0.06,
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.03),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            border: Border.all(
                              color: grey,
                            ),
                          ),
                          child: DropdownButton(
                            value: dropDownValue,
                            underline: const SizedBox(),
                            isExpanded: true,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: productCategories.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  dropDownValue = newValue;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),

                    AddProductTextField(
                        title: 'Brand Name ',
                        hintText: 'Brand',
                        textController: brandNameController),
                    AddProductTextField(
                        title: 'Manufacturer Name',
                        hintText: 'Manufacturer',
                        textController: manufacturerNameController),
                    AddProductTextField(
                        title: 'country Origi',
                        hintText: 'country',
                        textController: countryOfOriginController),
                    AddProductTextField(
                        title: 'product Specifications',
                        hintText: 'Specifications',
                        textController: productSpecificationsController),
                    AddProductTextField(
                        title: 'product Price ',
                        hintText: 'Price',
                        textController: productPriceController),
                     AddProductTextField(title: 'discounted ProductPrice ', hintText: 'discounted ', textController: discountedProductPriceController),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    CustomButton(
                        ontap: () async {
                          if (context
                              .read<SellerProductProvider>()
                              .productImages
                              .isNotEmpty) {
                            setState(() {
                              addproductBtnPress = true;
                            });
                            await ProductServices.uploadImageToFirebaseStorage(
                                images: context
                                    .read<SellerProductProvider>()
                                    .productImages,
                                context: context);
                            List<String> imagesURLs = context
                                .read<SellerProductProvider>()
                                .productImagesURL;
                            Uuid uuid = Uuid();
                            String sellerID = auth.currentUser!.phoneNumber!;
                            String productID = '$sellerID${uuid.v1()}';
                             double discountAmount = double.parse(productPriceController.text.trim()) -
          double.parse(discountedProductPriceController.text.trim());
      double discountPercentage =
          (discountAmount / double.parse(productPriceController.text.trim())) *
              100;
                            ProductModel model = ProductModel(
                                imagesURL: imagesURLs,
                                name: productNameController.text.trim(),
                                category: dropDownValue,
                                description:
                                    productDescriptionController.text.trim(),
                                brandName: brandNameController.text.trim(),
                                manufacturerName:
                                    manufacturerNameController.text.trim(),
                                countryOfOrigin:
                                    countryOfOriginController.text.trim(),
                                specifications:
                                    productSpecificationsController.text.trim(),
                                price: double.parse(
                                    productPriceController.text.trim()),
                                productID: productID,
                                productSellerID: sellerID,
                                discountedPrice:
            double.parse(discountedProductPriceController.text.trim()),
                                inStock: true,
                                 uploadedAt: DateTime.now(),
        discountPercentage: int.parse(discountPercentage.toStringAsFixed(0,)) );
                            await ProductServices.addProduct(
                                context: context, productModel: model);
                            showToast(
                                context: context,
                                message: 'Product Added Successful');
                          }
                        },
                        child: addproductBtnPress
                            ? CircularProgressIndicator(
                                color: white,
                              )
                            : Text(
                                'Add Product',
                                style: theme.textTheme.displaySmall,
                              ),
                              color: amber,
                        height: height * 0.06,
                        width: width)
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
