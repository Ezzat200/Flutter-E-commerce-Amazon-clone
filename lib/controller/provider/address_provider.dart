import 'dart:developer';

import 'package:amazon_clone/controller/services/user_data_crud_services/user_data_Crud_services.dart';
import 'package:amazon_clone/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier{
  List<AddressModel> allAddressModel = [];
  AddressModel currentSelectedAddress = AddressModel();
  bool fetchedCurrentSelectedAddress = false;
  bool fetchedAllAddress = false;
  getAllAddress()async{
allAddressModel = await UserDataCRUD.getAllAddress();
fetchedAllAddress = true;
log(allAddressModel.toList().toString());
notifyListeners();

  }
  getCurrentSelectedAddress()async{
currentSelectedAddress = await UserDataCRUD.getCurrentSelectedAddress();
    fetchedCurrentSelectedAddress = true;
notifyListeners();
  }
  
}