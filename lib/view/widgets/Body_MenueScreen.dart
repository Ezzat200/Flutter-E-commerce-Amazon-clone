
import 'package:amazon_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class BodyMenueScreen extends StatelessWidget {
  const BodyMenueScreen({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: width,
       
        padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 0.02),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: appBarGradientColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
                child: Column(
                  children: [
                    Container(
                    child: 
                      GridView.builder(
                        itemCount: 18,
                        physics: const PageScrollPhysics(),
                        gridDelegate:
                       const  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                           mainAxisSpacing: 10,
                           crossAxisSpacing: 10,
                           childAspectRatio: 0.8,
                      ),
                      shrinkWrap: true,
                       itemBuilder: (context ,index){
                         return Container(decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: greyShade3),
                          image: DecorationImage(image: AssetImage('assets/images/menu_pics/$index.png'),fit: BoxFit.fill)
                         ),);
                      }),
                      
                          
                  ),
                  SizedBox(height: height*0.02,),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                   return Container(
                    width: width,
                    height: height*0.06,
                    margin: EdgeInsets.symmetric(vertical: height*0.005),
                    padding: EdgeInsets.symmetric(vertical: height*0.007,horizontal: width*0.03),
          
                    decoration: BoxDecoration(
                    color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyShade3)
                    ),
                    child: Row(
                      children: [Text(index ==0?'Settings':'Customer Service'),
                      const Spacer(),
                     const Icon(Icons.chevron_right_rounded)
                      ],
                    ),
                   );
                  })
                  ]
                )
      ),
    );
  }
}
