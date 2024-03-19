import 'package:amazon_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class RitchText extends StatelessWidget {
  const RitchText({
    super.key, required this.text_1, required this.text_2,this.text_3,this.text_4
  });
 final String text_1;
 final String text_2;
 final String ?text_3;
 final String ?text_4;


  @override
  Widget build(BuildContext context) {
  
    final textTheme = Theme.of(context).textTheme;
    // return RichText(
    //   text: TextSpan(
    //     children: [
    //       TextSpan(
    //           text: text_1,
    //           style: textTheme.bodyMedium!
    //               .copyWith(fontWeight: FontWeight.bold)),
    //       TextSpan(
    //           text: text_2, style: textTheme.bodyMedium)
    //     ],
    //   ),
    // );
    return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Continuing you agree to Amazon\'s ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Conditions of use ',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Privacy Notice',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      )
                    ],
                  ),
                );
  }
}