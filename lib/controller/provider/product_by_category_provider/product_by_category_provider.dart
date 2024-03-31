import 'package:flutter/material.dart';

import '../../../model/product_model.dart';
import '../../services/users_product_services/users_product_services.dart';

class ProductsBasedOnCategoryProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  bool productsFetched = false;
  List<ProductModel>ElctronicProduct=[];
  List<ProductModel>FashionProduct=[];

  fetchProducts({required String category}) async {
    products = [];
    ElctronicProduct=[];
    FashionProduct=[];
   
     ElctronicProduct = await UsersProductService.fetchProductBasedOnCategory(
        category: 'Electronics');
    productsFetched = true;
   
   
 FashionProduct = await UsersProductService.fetchProductBasedOnCategory(
        category: 'Fashion');
    productsFetched = true;
  
   
    products = await UsersProductService.fetchProductBasedOnCategory(
        category: category);
    productsFetched = true;
    notifyListeners();
  }

}
