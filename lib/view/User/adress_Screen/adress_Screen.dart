// ignore_for_file: sort_child_properties_last

import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/controller/services/user_data_crud_services/user_data_Crud_services.dart';
import 'package:amazon_clone/model/address_model.dart';
import 'package:amazon_clone/model/user_model.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/Custom_TextFromField.dart';
import 'package:amazon_clone/view/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _UserDataInputScreenState();
}

class _UserDataInputScreenState extends State<AddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController stateController = TextEditingController();

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
          body: ListView(children: [
            Container(
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
                    height: height * 0.09,
                    width: width * 0.9,
                    mobileController: phoneController,
                    hintText: 'phone number',
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Enter house Number',
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextField(
                    height: height * 0.09,
                    width: width * 0.9,
                    mobileController: houseNumberController,
                    hintText: 'house number',
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Enter area',
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextField(
                    height: height * 0.09,
                    width: width * 0.9,
                    mobileController: areaController,
                    hintText: 'area',
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Enter landMark',
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextField(
                    height: height * 0.09,
                    width: width * 0.9,
                    mobileController: landMarkController,
                    hintText: 'landMark',
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Enter pincode',
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextField(
                    height: height * 0.09,
                    width: width * 0.9,
                    mobileController: pincodeController,
                    hintText: 'pincode',
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Enter town',
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextField(
                    height: height * 0.09,
                    width: width * 0.9,
                    mobileController: townController,
                    hintText: 'town',
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Enter state',
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomTextField(
                    height: height * 0.09,
                    width: width * 0.9,
                    mobileController: stateController,
                    hintText: 'state',
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  CustomButton(
                      ontap: () async {
                        Uuid uuid = Uuid();
                        String docID = uuid.v1();
                        AddressModel addressModel = AddressModel(
                            name: nameController.text.trim(),
                            mobileNumber: phoneController.text.trim(),
                            houseNumber: houseNumberController.text.trim(),
                            area: areaController.text.trim(),
                            landMark: landMarkController.text.trim(),
                            pincode: pincodeController.text.trim(),
                            town: townController.text.trim(),
                            state: stateController.text.trim(),
                            docID: docID,
                            isDefault: true);
                        await UserDataCRUD.addUserAddress(
                          addressModel: addressModel,
                          context: context,
                          docID: docID,
                        );
                      },
                      child: Text(
                        'Add Address',
                        style: theme.textTheme.displaySmall,
                      ),
                      height: height * 0.06,
                      width: width)
                ],
              ),
            ),
          ])),
    );
  }
}
