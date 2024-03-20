
import 'package:amazon_clone/utils/theme.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
     
    required this.crossAxisCount, required this.items, required this.imagePath, required this.boxFit,
    this.text
  });
final int crossAxisCount;
 final List<String> items;
  final String imagePath;
  final BoxFit boxFit;
  final String ?text;
  
 
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
         itemCount: 4,
         gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: crossAxisCount,
         mainAxisSpacing: 10,
         crossAxisSpacing: 20
         ),
         shrinkWrap: true, itemBuilder: (context,index){
         return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children:[ Expanded(
             child: Container(
              
               decoration: BoxDecoration(
                 
                 image: DecorationImage(
                   fit: boxFit,
                   image:AssetImage(
                     '$imagePath${items[index]}',
                      )
                   , ),
               ),
             ),
           ),
              
           ]
         );
       });
  }
}
