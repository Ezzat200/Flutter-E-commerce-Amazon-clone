import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '0.0',
          style: theme.textTheme.bodyMedium!
              .copyWith(color: teal),
        ),
        SizedBox(
          width: width * 0.01,
        ),
        RatingBar(
          initialRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: width * 0.06,
          // ignoreGestures: true,
          ratingWidget: RatingWidget(
            full: Icon(
              Icons.star,
              color: amber,
            ),
            half: Icon(
              Icons.star_half,
              color: amber,
            ),
            empty: Icon(
              Icons.star_outline_sharp,
              color: amber,
            ),
          ),
          itemPadding: EdgeInsets.zero,
          onRatingUpdate: (rating) {},
        ),
        SizedBox(
          width: height * 0.01,
        ),
        Text(
          '(0)',
          style: theme.textTheme.bodyMedium
        ),
      ],
    );
  }
}
