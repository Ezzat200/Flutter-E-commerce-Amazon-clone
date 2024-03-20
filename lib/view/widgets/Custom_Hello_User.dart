
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:flutter/material.dart';

class CustomHelloUser extends StatelessWidget {
  const CustomHelloUser({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.04),
      child: Row(
        children: [
         Text.rich(TextSpan(children: [
          TextSpan(text: 'Hello,',style: theme.textTheme.bodyLarge),
          TextSpan(text: 'Egypt,',style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
         ])),
        const Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundColor: greyShade3,
          child: const Icon(Icons.person_outlined),
        )
        ],
      ),
    );
  }
}
