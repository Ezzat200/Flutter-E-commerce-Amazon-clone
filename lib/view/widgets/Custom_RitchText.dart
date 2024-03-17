
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:flutter/cupertino.dart';

class CustomRitchText extends StatelessWidget {
  const CustomRitchText({
    super.key, required this.text1, required this.text2, required this.text3, required this.text4,
  });
final String text1,text2,text3,text4;
  @override
  Widget build(BuildContext context) {
    return RichText(
      
        text: TextSpan(children: [
      TextSpan(
        text: text1,
        style: theme.textTheme.labelMedium,
      ),
      TextSpan(
        text: text2,
        style: TextStyle(color: blue),
      ),
      TextSpan(
        text: text3,
        style: theme.textTheme.labelMedium,
      ),
      TextSpan(
        text: text4,
        style: TextStyle(color: blue),
      )
    ]));
  }
}
