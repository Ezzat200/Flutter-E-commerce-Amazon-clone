import 'package:amazon_clone/controller/services/users_product_services/users_product_services.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/model/user_product_model.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/Custom_CaroselNetWork.dart';
import 'package:amazon_clone/view/widgets/Custom_Diveder.dart';
import 'package:amazon_clone/view/widgets/Custom_Nav_Bar.dart';
import 'package:amazon_clone/view/widgets/Custom_Rating.dart';

import 'package:amazon_clone/view/widgets/Custom_button.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.1),
        child: CustomNavBar(width: width, height: height),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CaroselNetWork(height: height, currentModel: widget.productModel),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brand: ${widget.productModel.brandName}',
                    style: theme.textTheme.labelMedium!.copyWith(color: teal),
                  ),
                  CustomRating(width: width, height: height),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                widget.productModel.name!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelMedium,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '-${widget.productModel.discountPercentage}%',
                        style: theme.textTheme.displayLarge!
                            .copyWith(color: red, fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: '\t\$${widget.productModel.price}',
                        style: theme.textTheme.displayLarge!
                            .copyWith(color: black, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              Text(
                'M.R.P:\$${widget.productModel.price}',
                style: theme.textTheme.labelMedium!.copyWith(
                    color: grey, decoration: TextDecoration.lineThrough),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomButton(
                ontap: ()async {
           UserProductModel model =       UserProductModel(
 imagesURL          :widget.productModel.imagesURL,
 name               :widget.productModel.name,
 category           :widget.productModel.category,
 description        :widget.productModel.description,
 brandName          :widget.productModel.brandName,
 manufacturerName   :widget.productModel.manufacturerName,
 countryOfOrigin    :widget.productModel.countryOfOrigin,
 specifications     :widget.productModel.specifications,
 price              :widget.productModel.price,
 discountedPrice    :widget.productModel.discountedPrice,
 productID          :widget.productModel.productID,
 productSellerID    :widget.productModel.productSellerID,
 inStock            :widget.productModel.inStock,
 discountPercentage :widget.productModel.discountPercentage,
 productCount       :1,
 time               :DateTime.now(),
                  );
                  await UsersProductService.addProductToCart(context: context, productModel: model);
                },
                color: amber,
                height: height * 0.06,
                width: width,
                child: Text(
                  'Add To Cart',
                  style: theme.textTheme.displayLarge!.copyWith(
                    color: black,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              // CustomButton(
              //   color: orange,
              //   height: height * 0.06,
              //   width: width,
              //   child: Text(
              //     'Buy Now',
              //     style: theme.textTheme.displayLarge!.copyWith(
              //       color: black,
              //     ),
              //   ),
              // ),
                          SizedBox(
                height: height * 0.02,
              ),
              const CustomDivider(),
                          SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Features',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                
              ),
                        SizedBox(
                height: height * 0.02,
              ),
              Text(
                widget.productModel.description!,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: grey
                ),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
