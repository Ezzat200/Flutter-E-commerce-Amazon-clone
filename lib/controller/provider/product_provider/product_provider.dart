import 'dart:io';


import 'package:amazon_clone/controller/services/product_services/product_services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductProvider extends ChangeNotifier {
  List<File> productImages = [];
  List<String> productImagesURL = [];
  

  fetchProductImagesFromGallery({required BuildContext context}) async {
    productImages = await ProductServices.getImages(context: context);
    notifyListeners();
  }

  updateProductImagesURL({required List<String> imageURLs}) async {
    productImagesURL = imageURLs;
    notifyListeners();
  }



}
