import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RowAuthScreen extends StatefulWidget {
  const RowAuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RowAuthScreen> createState() => _RowAuthScreenState();
}

class _RowAuthScreenState extends State<RowAuthScreen> {
  bool islogin = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          height: height * 0.06,
          width: width * 0.99,
          color: greyShade3,
          child: Row(
            children: [
              SizedBox(width: width * 0.01),
              GestureDetector(
                onTap: () {
                  islogin = !islogin;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: white,
                    child: islogin
                        ? Icon(Icons.circle, color: orange, size: 20)
                        : const Icon(Icons.circle,
                            color: Colors.transparent, size: 20),
                  ),
                ),
              ),
              SizedBox(width: width * 0.01),
              Text(
                'Create account.',
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: width * 0.01),
              Text(
                ' New to Amazon?',
                style: theme.textTheme.bodyLarge,
              )
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          height: height * 0.06,
          width: width * 0.99,

          child: Row(
            children: [
              SizedBox(width: width * 0.01),
              GestureDetector(
                onTap: () {
                  islogin = !islogin;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CircleAvatar(
                      radius: 18,
                      backgroundColor: white,
                      child: islogin
                          ? const Icon(Icons.circle,
                              color: Colors.transparent, size: 20)
                          : Icon(Icons.circle, color: orange, size: 20)),
                ),
              ),
              SizedBox(width: width * 0.01),
              Text(
                'Create account.',
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: width * 0.01),
              Text(
                ' New to Amazon?',
                style: theme.textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ],
    );
  }
}
