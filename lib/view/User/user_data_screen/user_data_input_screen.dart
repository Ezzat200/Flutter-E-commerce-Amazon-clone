// ignore_for_file: sort_child_properties_last

import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/controller/services/user_data_crud_services/user_data_Crud_services.dart';
import 'package:amazon_clone/model/user_model.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/Custom_TextFromField.dart';
import 'package:amazon_clone/view/widgets/Custom_button.dart';
import 'package:flutter/material.dart';

class UserDataInputScreen extends StatefulWidget {
  const UserDataInputScreen({super.key});

  @override
  State<UserDataInputScreen> createState() => _UserDataInputScreenState();
}

class _UserDataInputScreenState extends State<UserDataInputScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneController.text = auth.currentUser!.phoneNumber ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(width * 1, height * 0.09),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.015),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: appBarGradientColor,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03, vertical: height * 0.008),
                    child: Image(
                      image: const AssetImage(
                          'assets/images/amazon_black_logo.png'),
                      height: height * 0.04,
                    ),
                  ),
                ],
              ),
            )),
        body: Container(
          // height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Your Name',
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextField(
                height: height * 0.09,
                width: width * 0.9,
                mobileController: nameController,
                hintText: 'enter your name',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Enter Phone Number',
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextField(
                readOnly: true,
                height: height * 0.09,
                width: width * 0.9,
                mobileController: phoneController,
                hintText: 'phone number',
              ),
              const Spacer(),
              CustomButton(
                  ontap: () async {
                    UserModel userModel = UserModel(
                      name: nameController.text.trim(),
                      mobileNum: phoneController.text.trim(),
                      userType: 'user',
                      
                    );
                    await UserDataCRUD.addNewUser(
                        userModel: userModel, context: context);
                  },
                  child: Text(
                    'Proceed',
                    style: theme.textTheme.displaySmall,
                  ),
                  color: amber,
                  height: height * 0.06,
                  width: width)
            ],
          ),
        ),
      ),
    );
  }
}
