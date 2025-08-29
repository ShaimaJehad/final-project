import 'package:flutter/material.dart';
import 'package:project_flutter/screens/auth/login_widgets/widgets.dart';

import 'login_widgets/app_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  
  
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
   
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
   
    _passwordTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child:  ListView(
              
              children: [
                SizedBoxMethod(80),
                MainTextMethod1("Reset Password"),
        
        
                SizedBoxMethod(25),
        
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15, right: 30, left: 30),
                  child: Text("Enter new password", style: TextStyle(fontFamily: "poppins", fontWeight: FontWeight.w500, color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),),
                ),
        
                
        
                PaddingTextField(textController: _passwordTextController, left_padding: 20, right_padding: 20, bottom_padding: 10, prefix_image: "images/password.png", hint_text: "Enter new password", type_input: TextInputType.text, scure: true,),
        


                
        
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10, right: 30, left: 30),
                  child: Text("Again Enter password", style: TextStyle(fontFamily: "poppins", fontWeight: FontWeight.w500, color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),),
                ),
        
                
        
                PaddingTextField(textController: _passwordTextController, left_padding: 20, right_padding: 20, bottom_padding: 20, prefix_image: "images/password.png", hint_text: "Enter new password", type_input: TextInputType.text, scure: true, ),


                SizedBoxMethod(50),
        
                PaddingElevatedButton(20, 20, 280, 60, 24, Color(0xff1599CE), "Next", Color(0xffffffff)),

                SizedBoxMethod(60),
        
        
              ]),
          ),
        ),

    );
  }
}