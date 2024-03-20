
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:flutter/material.dart';

class CustomGridViewUserScreen extends StatelessWidget {
  const CustomGridViewUserScreen({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3.2
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            // width: width*0.4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              
                color: greyShade2,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: grey),), 
            child: Builder(
              
              builder: (BuildContext context) { 
          
              if (index == 0) {
                return Text(
                  'Your Order',
                  style: theme.textTheme.bodyMedium,
                );
              }
              if (index == 1) {
                return Text(
                  'Buy Again',
                  style: theme.textTheme.bodyMedium,
                );
              }
              if (index == 2) {
                return Text(
                  'Your Account',
                  style: theme.textTheme.bodyMedium,
                );
              }
              if (index == 3) {
                return Text(
                  'Your Wish List',
                  style: theme.textTheme.bodyMedium,
                );
              }else{
                return const Text('anything');
              }
            }),
          );
        });
  }
}
