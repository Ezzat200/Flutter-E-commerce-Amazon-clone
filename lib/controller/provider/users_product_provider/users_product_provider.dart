import 'package:amazon_clone/controller/services/users_product_services/users_product_services.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:flutter/material.dart';

class UsersProductProvider extends ChangeNotifier{
List<ProductModel> searchedProducts=[];
bool productsFetched = false;
emptySearchProductsList(){
  searchedProducts=[];
  notifyListeners();
}

getSearchedProducts({required String productName })async{
  searchedProducts =await UsersProductService.getProducts(productName);
  productsFetched=true; 
  notifyListeners();
}
}