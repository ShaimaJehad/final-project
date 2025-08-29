import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter/screens/FireResponseClass.dart';
import 'package:project_flutter/screens/auth/login_screen.dart';
import 'package:project_flutter/screens/auth/login_widgets/app_text_field.dart';
import 'package:project_flutter/screens/firebase_controller.dart';
import 'package:project_flutter/screens/firestore_controller.dart';
import 'package:project_flutter/screens/home_screen.dart';
import 'package:project_flutter/screens/my_user.dart';
import 'package:project_flutter/screens/sph.dart';

import 'login_widgets/widgets.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  
  
  MyUser get user {
    MyUser myUser = MyUser();
    myUser.name = _nameTextController.text;
    myUser.id = SharedPrefHelper().getData();
    myUser.email = _emailTextController.text;
    myUser.password = _passwordTextController.text;
    return myUser;
  }

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(

        child: Center(
      
          child: ListView(
            children: [
      
              Center(
                child: Container(
                  width: double.infinity,
                  child: Stack(
                    
                    children: [
                
                      Positioned(
                        top: 8,
                        left: 8,
                        child: IconButton(
                          onPressed:() {
                          Get.back();  
                          },
                          icon: Icon(Icons.arrow_back_rounded, color: Colors.black, size: 24,),)
                          ),
                
                      Center(
                        child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/logo_job.jpg"),
                          ),
                        ),
                                          ),
                      ),
                    ]
                  ),
                ),
              ),

      
      
              ScoundTextMethod("Hello there, sign up to continue!"),
      
      
              SizedBoxMethod(30),


              PaddingTextField(textController: _nameTextController, left_padding: 20, right_padding: 20, bottom_padding: 12, prefix_image: "images/name.png", hint_text: "Enter your name", type_input: TextInputType.name, scure: false,),
      
      
              PaddingTextField(textController: _emailTextController, left_padding: 20, right_padding: 20, bottom_padding: 12, prefix_image: "images/email.png", hint_text: "Enter your email address", type_input: TextInputType.emailAddress, scure: false,),


              PaddingTextField(textController: _passwordTextController, left_padding: 20, right_padding: 20, bottom_padding: 40, prefix_image: "images/password.png", hint_text: "Enter your password", type_input: TextInputType.text, scure: true,),
      
      
              Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(280, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  shadowColor: Color(0xff000000),
                  backgroundColor: Color(0xff1599CE),
                ),
                onPressed: () async => await _performRegister(),

                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "manrope"),
                ),
              ),
            ),

            SizedBoxMethod(50),


            ScoundTextMethod("Or continue with social account"),
      
            SizedBoxMethod(15),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset("images/google.png", width: 30, height: 30,),
                  ),
                  Image.asset("images/facebook.png", width: 24, height: 24,),
      
                  
                ],
              ),

            
      
      
            ],
          ),
        ),
      ),
    );
  }


    Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }

    // showSnackBar(context:context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _register() async {
    FireResponseClass b = await FireBaseConteroller().rigester(email: _emailTextController.text,password: _passwordTextController.text);
    if(b.status){
      FireStoreController().newUser(user: user);
      Get.off(()=>LoginScreen());
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(b.message)));
  }

}