

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'login_widgets/widgets.dart';

class VerifyPhoneNumScreen extends StatefulWidget {

  @override
  State<VerifyPhoneNumScreen> createState() => _VerifyPhoneNumScreenState();
}

class _VerifyPhoneNumScreenState extends State<VerifyPhoneNumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
            children: [
        
              SizedBoxMethod(80),
                
              MainTextMethod1("Verify Your Email"),
                
                
              SizedBoxMethod(17),
                
              ScoundTextMethod(''' We have sent code to your Email
*******il30@gmail.com'''),
                
              SizedBoxMethod(55),
        
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                
                    _textFieldOTP(first: true),
                      _textFieldOTP(first: false),
                      _textFieldOTP(first: false),
                      _textFieldOTP(first: false),
                
                
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Container(
                  //     height: 75,
                  //     width: 75,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xffFF9801),
                  //       borderRadius: BorderRadius.circular(24),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(15),
                  //       child: TextField(
                  //         textAlign: TextAlign.center,
                  //         keyboardType: TextInputType.number,
                  //         showCursor: false,
                  //         maxLength: 1,
                  //         style: TextStyle(fontSize: 22, fontFamily: 'manrope', fontWeight: FontWeight.bold, color: Color(0xffffffff)),
                  //         decoration: InputDecoration(
                  //           border: InputBorder.none,
                            
                            
                  //         ),
                  //       ),
                  //     ),
                      
                  //   ),
                  // ),
                
                  // SizedBox(
                  //   height: 75,
                  //   width: 75,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       filled: true,
                  //       fillColor: Color(0xffFF9801),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Color(0xffFF9801)),
                  //       borderRadius: BorderRadius.circular(24),
                  //     ),
                      
                  //     ),
                  //   ),
                  // ),
                
                
                
                ],),
              ),
        
              
              
        
              SizedBoxMethod(90),
        
              PaddingElevatedButton(20, 20, 280, 60, 24, Color(0xff1599CE), "Send Code", Color(0xffffffff)),
        
        
              SizedBoxMethod(90),
        
        
        
            ]
        ),
      
    );
  }



Widget _textFieldOTP({first}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 73,
        width: 60,
        child: TextField(
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            filled: true,
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xff1599CE)),
                borderRadius: BorderRadius.circular(12),
                ),
          ),
        ),
      ),
    );
  }
}