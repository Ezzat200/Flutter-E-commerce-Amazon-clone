
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){}, child: Text(text,style: theme.textTheme.bodyMedium!.copyWith(color: blue),));
  }
}