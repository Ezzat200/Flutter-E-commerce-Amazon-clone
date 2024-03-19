
import 'package:amazon_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: greyShade1,
      thickness: 3,
      height: 0,
    );
  }
}
