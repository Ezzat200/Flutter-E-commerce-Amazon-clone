// ignore_for_file: use_build_context_synchronously

import 'package:amazon_clone/controller/provider/address_provider.dart';
import 'package:amazon_clone/controller/provider/deal_of_theDay_provider/deal_of_theday_provider.dart';
import 'package:amazon_clone/controller/services/user_data_crud_services/user_data_Crud_services.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/User/adress_Screen/adress_Screen.dart';
import 'package:amazon_clone/view/widgets/Custom_Nav_Bar.dart';
import 'package:amazon_clone/view/widgets/body_HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  checkUserAddress() async {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    bool userAddressPresent = await UserDataCRUD.checkUsersAddress();
    if (userAddressPresent == false) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.04),
              height: height * 0.3,
              width: width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Address',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: height * 0.15,
                      child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const AddressScreen(),
                                        type: PageTransitionType.rightToLeft));
                              },
                              child: Container(
                                width: width * 0.35,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.03,
                                    vertical: height * 0.01),
                                decoration: BoxDecoration(
                                  border: Border.all(color: greyShade3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Builder(builder: (context) {
                                  if (index == 0) {
                                    return Text(
                                      'Add Address',
                                      style: theme.textTheme.bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: greyShade3),
                                    );
                                  } else {
                                    return Text(
                                      'Add Address',
                                      style: theme.textTheme.bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: greyShade3),
                                    );
                                  }
                                }),
                              ),
                            );
                          }),
                    ),
                  ]),
            );
          });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUserAddress();
      context.read<AddressProvider>().getCurrentSelectedAddress();
      context.read<DealOfTheDayProvider>().fetchTodaysDeal();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(width * 1, height * 0.08),
            child: CustomNavBar(width: width, height: height),
          ),
          body: const BodyHomeScreen()),
    );
  }
}
