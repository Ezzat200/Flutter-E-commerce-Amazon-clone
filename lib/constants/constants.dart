import 'package:amazon_clone/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
List<String> categories = [
  'Prime',
  'Electronics',
  'Home',
  'miniTV',
  'Mobiles',
  'Fashion',
  'Beauty',
  'Books',
  'Appliances',
];

List<String> carouselPictures = [
  '1.png',
  '2.png',
  '3.png',
  '4.png',
  '5.png',
  '6.png',
  '7.png',
  '8.png',
  '9.png',
];

List<String> todaysDeals = [
  'todaysDeal0.png',
  'todaysDeal1.png',
  'todaysDeal2.png',
  'todaysDeal3.png',
];

List<String> headphonesDeals = [
  'bose.png',
  'boat.png',
  'sony.png',
  'onePlus.png',
];

List<String> clothingDealsList = [
  'kurta.png',
  'tops.png',
  't_shirts.png',
  'view_all.png',
];

List<String> productCategories = [
  'Select Category',
  'Electronics',
  'Home',
  'Mobiles',
  'Fashion',
  'Beauty',
  'miniTV',
  'Appliances',
  'Books',
  'Prime',
];

showToast({required BuildContext context, required String message}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: white,
    textColor: black,
    fontSize: 16.0,
  );
}
