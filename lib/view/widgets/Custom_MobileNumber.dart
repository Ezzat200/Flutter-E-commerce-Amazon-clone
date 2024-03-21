import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/Custom_TextFromField.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMobileNumber extends StatefulWidget {
  const CustomMobileNumber({
    super.key,
  });

  @override
  State<CustomMobileNumber> createState() => _CustomMobileNumberState();
}

class _CustomMobileNumberState extends State<CustomMobileNumber> {
  String currentCountryCode = '+20';
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.01, vertical: height * 0.01),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showCountryPicker(
                  context: context,
                  onSelect: (val) {
                    setState(() {
                      currentCountryCode = '+${val.phoneCode}';
                    });
                  });
            },
            child: Container(
              height: height * 0.08,
              width: height * 0.12,
              decoration: BoxDecoration(
                  color: greyShade3.withOpacity(0.5),
                  border: Border.all(color: black38, width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Text(
                currentCountryCode,
                style: theme.textTheme.displaySmall!
                    .copyWith(fontWeight: FontWeight.w600),
              )),
            ),
          ),
          SizedBox(
            width: width * 0.02,
          ),
          CustomTextField(
              height: height* 0.08, width:  width *0.64, mobileController: mobileController,hintText: 'Mobile Number',),

        ],
      ),
    );
  }
}
