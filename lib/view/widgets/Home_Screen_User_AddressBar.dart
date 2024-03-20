
import 'package:amazon_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreenUserAddressBar extends StatelessWidget {
  const HomeScreenUserAddressBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: addressBarGradientColor),
      ),
    );
  }
}
