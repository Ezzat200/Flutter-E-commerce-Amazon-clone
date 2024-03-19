
import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height*0.1,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
      itemBuilder: (context,index){
         return Container(
      margin:EdgeInsets.symmetric(horizontal: width*0.008) ,
           child: Column(
    
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                     Image(
                      image: AssetImage('assets/images/categories/${categories[index]}.png'
                      ),
                      height: width*0.07
                    ), 
                    Text( categories[index],style: theme.textTheme.labelMedium,)
            ],
           ),
         );
      }),
    );
  }
}
