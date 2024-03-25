
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CaroselNetWork extends StatelessWidget {
  const CaroselNetWork({
    super.key,
    required this.height,
    required this.currentModel,
  });

  final double height;
  final ProductModel currentModel;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      
      options: CarouselOptions(
        height: height * 0.2,
        autoPlay: false,
        viewportFraction: 1,
      ),
      items: currentModel.imagesURL!.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width:
                  MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: white,
                image: DecorationImage(
                  image: NetworkImage(i),
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
