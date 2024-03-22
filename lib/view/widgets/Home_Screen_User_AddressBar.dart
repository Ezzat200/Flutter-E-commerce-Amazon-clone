
// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:amazon_clone/controller/provider/address_provider.dart';
import 'package:amazon_clone/model/address_model.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenUserAddressBar extends StatelessWidget {
  const HomeScreenUserAddressBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: addressBarGradientColor),
      ),
     
      
      child: Consumer<AddressProvider>(builder: (context,addressProvider,child){
        if(addressProvider.fetchedCurrentSelectedAddress == true){
            AddressModel selectedAddress = addressProvider.currentSelectedAddress;
          log('${selectedAddress.name}');
          return Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Icon(Icons.location_pin,color: black,),
            SizedBox(width: width*0.02,),
            Text('Deliver to -${selectedAddress.name},${selectedAddress.town}')

          ],);
        }else{
return Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Icon(Icons.location_pin,color: black,),
            SizedBox(width: width*0.02,),
           const Text('Deliver to - user ,City ')]);
        }
      })
    );
  }
}
