
import 'package:amazon_clone/controller/provider/product_by_category_provider/product_by_category_provider.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/view/User/product_screen/product_screen.dart';
import 'package:amazon_clone/view/widgets/Custom_Text_Button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CustomCategoryMobiles extends StatefulWidget {
  const CustomCategoryMobiles({
    super.key,
    required this.width,
    required this.height, required this.category,
  });

  final double width;
  final double height;
final String  category;
  @override
  State<CustomCategoryMobiles> createState() => _CustomCategoryElctronicsState();
}

class _CustomCategoryElctronicsState extends State<CustomCategoryMobiles> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProductsBasedOnCategoryProvider>().fetchProducts(category: widget.category);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsBasedOnCategoryProvider>(
     
      builder: (context, usersProductProvider, child) {
             if (usersProductProvider.productsFetched == false) {
               return Center(
                 child: CircularProgressIndicator(
                   color: amber,
                 ),
               );
             } else if (usersProductProvider.MobileProduct.isEmpty) {
               return const Center(
                 child: Text('oops! product not found'),
               );
             }else{
               return Container(
           width: widget.width,
           padding: EdgeInsets.symmetric(
               vertical: widget.height * 0.01, horizontal: widget.width * 0.03),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               
               GridView.builder(
       physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          gridDelegate:
       const  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20
          ),
          shrinkWrap: true, itemBuilder: (context,index){
           ProductModel currenProduct =
                         usersProductProvider.MobileProduct[index];
          return GestureDetector(
            onTap: () {
               Navigator.push(
                            context,
                            PageTransition(
                                child:
                                    ProductScreen(productModel: currenProduct),
                                type: PageTransitionType.rightToLeft));
            },
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children:[ Expanded(
                child: Container(
                 
                  decoration: BoxDecoration(
                    
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image:NetworkImage(
                                       currenProduct.imagesURL![0],
                                       
                                     ),
                       ),
                  ),
                ),
              ),
                 
              ]
            ),
          );
        }),
               SizedBox(
                 height: widget.height * 0.03,
               ),
               const CustomTextButton(text: 'Explor More'),
             ],
           ),
         );
             }
      });
  }
}
