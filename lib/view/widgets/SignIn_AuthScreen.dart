
import 'package:amazon_clone/utils/colors.dart';
import 'package:amazon_clone/utils/theme.dart';
import 'package:amazon_clone/view/widgets/Custom_MobileNumber.dart';
import 'package:amazon_clone/view/widgets/Custom_RitchText.dart';
import 'package:amazon_clone/view/widgets/Custom_TextFromField.dart';
import 'package:amazon_clone/view/widgets/Custom_button.dart';
import 'package:flutter/material.dart';

class SignInAuthScreen extends StatefulWidget {
  const SignInAuthScreen({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<SignInAuthScreen> createState() => _SignInAuthScreenState();
}

class _SignInAuthScreenState extends State<SignInAuthScreen> {
  bool islogin = false;
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return 
    Builder(builder: (context){
if(islogin){
  return   Container(
        decoration:
            BoxDecoration(border: Border.all(color: greyShade3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Column(
      children: [
        Container(
          height: height * 0.06,
          width: width * 0.99,
          color: greyShade3,
          child: Row(
            children: [
              SizedBox(width: width * 0.01),
              GestureDetector(
                onTap: () {
                  islogin = true;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: white,
                    child: islogin
                        ? Icon(Icons.circle, color: orange, size: 20)
                        : const Icon(Icons.circle,
                            color: Colors.transparent, size: 20),
                  ),
                ),
              ),
              SizedBox(width: width * 0.01),
              Text(
                'Create account.',
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: width * 0.01),
              Text(
                ' New to Amazon?',
                style: theme.textTheme.bodyLarge,
              )
            ],
          ),
        ),
       
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          height: height * 0.06,
          // width: width * 0.88,

          child: Row(
            children: [
              SizedBox(width: width * 0.01),
              GestureDetector(
                onTap: () {
                  islogin = false;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CircleAvatar(
                      radius: 18,
                      backgroundColor: white,
                      child: islogin
                          ? const Icon(Icons.circle,
                              color: Colors.transparent, size: 20)
                          : Icon(Icons.circle, color: orange, size: 20)),
                ),
              ),
              SizedBox(width: width * 0.01),
              Text(
                'Sign in.',
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: width * 0.01),
              Text(
                'Already an account?',
                style: theme.textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ],
    ),

            const CustomMobileNumber(),
            CustomButton(
              text: 'Continue',
            ),
            
            SizedBox(
              height: widget.height * 0.02,
            ),
            Padding(
              padding:  EdgeInsets.all(widget.width * 0.02),
              child: const CustomRitchText(
                text1: 'By countinuing you agree to Amazons',
                text2: 'Condition Of Use ',
                text3: 'and ',
                text4: 'Privacy Notice',
              ),
            ),
           
          ],
        ),
      );
}
   return Container(
       
      decoration:
          BoxDecoration(border: Border.all(color: greyShade3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Column(
      children: [
        Container(
       
          height: widget.height * 0.06,
          width: widget.width * 0.99,

          child: Row(
            children: [
              SizedBox(width: widget.width * 0.01),
              GestureDetector(
                onTap: () {
                  islogin = false;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CircleAvatar(
                      radius: 18,
                      backgroundColor: white,
                      child: islogin
                          ? const Icon(Icons.circle,
                              color: Colors.transparent, size: 20)
                          : Icon(Icons.circle, color: orange, size: 20)),
                ),
              ),
              SizedBox(width: widget.width * 0.01),
              Text(
                'Create account.',
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: widget.width * 0.01),
              Text(
                ' New to Amazon?',
                style: theme.textTheme.bodyLarge,
              )
            ],
          ),
        ),
      
      ],
    ),
    SizedBox(height: widget.height * 0.01),
          CustomTextField(height: widget.height * 0.08, width:widget.width* 0.89, mobileController: mobileController, hintText: 'First and LastName'),

          const CustomMobileNumber(),
        Padding(
          padding:  EdgeInsets.all(widget.width * 0.02),
          child: const  Text('By enrolling your mobile phone number ,concent to recive automated security notifcations via text message from Amazon \n Message and data rates may apply'),
        ),
          CustomButton(
            text: 'Verify mobile number',
          ),
          
          SizedBox(
            height: widget.height * 0.02,
          ),
          Padding(
            padding:  EdgeInsets.all(widget.width * 0.02),
            child: const CustomRitchText(
              text1: 'By countinuing you agree to Amazons',
              text2: 'Condition Of Use ',
              text3: 'and ',
              text4: 'Privacy Notice',
            ),
          ),
                  Container(
          height: widget.height * 0.06,
          width: widget.width * 0.99,
          color: greyShade3,
          child: Row(
            children: [
              SizedBox(width: widget.width * 0.01),
              GestureDetector(
                onTap: () {
                  islogin = true;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: white,
                    child: islogin
                        ? Icon(Icons.circle, color: orange, size: 20)
                        : const Icon(Icons.circle,
                            color: Colors.transparent, size: 20),
                  ),
                ),
              ),
              SizedBox(width: widget.width * 0.01),
              Text(
                'Sign in .',
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: widget.width * 0.01),
              Text(
               ' Already a Customer?',
                style: theme.textTheme.bodyLarge,
              )
            ],
          ),
        ),
       
         
        ],
      ),
    );
 
   

    });
     
   
  }
}
