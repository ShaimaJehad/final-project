import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_flutter/screens/auth/login_widgets/widgets.dart';

import 'login_widgets/app_text_field.dart';

class AddPhoneNumScreen extends StatefulWidget {
  const AddPhoneNumScreen({super.key});

  @override
  State<AddPhoneNumScreen> createState() => _AddPhoneNumScreenState();
}

class _AddPhoneNumScreenState extends State<AddPhoneNumScreen> {

   late TextEditingController _emailTextController;
 

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();

  }

  @override
  void dispose() {
    _emailTextController.dispose();
   
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
                MainTextMethod1("Forget Password"),
        
                //MainTextMethod2("with JobFinder"),
        
                SizedBoxMethod(25),
        
                ScoundTextMethod('''Enter your email,Enter your email
We will send you a verification code'''),
        
                SizedBoxMethod(35),
        
                PaddingTextField(textController: _emailTextController, left_padding: 20, right_padding: 20, bottom_padding: 20, prefix_image: "images/email.png", hint_text: "Enter your Email", type_input: TextInputType.emailAddress, scure: false,),
        
                SizedBoxMethod(105),
        
                PaddingElevatedButton(20, 20, 280, 60, 24, Color(0xff1599CE), "Next", Color(0xffffffff)),

                SizedBoxMethod(60),
        
        
              ]),
          ),
        ),
      
    );
  }
}
