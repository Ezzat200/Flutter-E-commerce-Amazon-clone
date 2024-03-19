
import 'package:amazon_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.005 ),
      decoration: BoxDecoration(gradient: LinearGradient(colors: appBarGradientColor,
      begin: Alignment.centerLeft, end:Alignment.centerRight),
      ),
      child: Row(
        children: 
        [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical:height* 0.008),
            width: width *0.8,
            child: TextField(
              onTap: () {
               
              },
              cursorColor: black,
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                prefixIcon: IconButton(onPressed: (){}, icon:const Icon(Icons.search,color: Colors.black,)),
                suffixIcon: IconButton(onPressed: (){}, icon:const Icon(Icons.camera_alt_sharp,color: Colors.grey,)),
        
        hintText: 'Search Amazon.in',
    
              contentPadding: EdgeInsets.symmetric(horizontal: width*0.03),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
              ),
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
              ),
              focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
              ),
              errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
              )
              ,),
          
            ),
          ),
        IconButton(onPressed: (){}, icon: const Icon(Icons.mic))
        ],
          
      ),
    );
  }
}