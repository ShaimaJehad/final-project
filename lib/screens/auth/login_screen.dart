import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter/screens/FireResponseClass.dart';
import 'package:project_flutter/screens/auth/admin_user.dart';
import 'package:project_flutter/screens/auth/login_widgets/widgets.dart';
import 'package:project_flutter/screens/auth/register_screen.dart';
import 'package:project_flutter/screens/firebase_controller.dart';
import 'package:project_flutter/screens/home_screen.dart';
import 'package:project_flutter/screens/user_buttom_nav.dart';

import 'login_widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
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

             

              ScoundTextMethod("Hello there, sign in to continue!"),

              SizedBoxMethod(30),

              PaddingTextField(
                textController: _emailTextController,
                left_padding: 20,
                right_padding: 20,
                bottom_padding: 12,
                prefix_image: "images/email.png",
                hint_text: "Enter your email address",
                type_input: TextInputType.emailAddress,
                scure: false,
              ),

              PaddingTextField(
                scure: true,
                textController: _passwordTextController,
                left_padding: 20,
                right_padding: 20,
                bottom_padding: 40,
                prefix_image: "images/password.png",
                hint_text: "Enter your password",
                type_input: TextInputType.text,
              ),

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
                  onPressed: () async => _performLogin(),
                  child: Text(
                    "Login",
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

              SizedBoxMethod(10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: Image.asset(
                        "images/google.png",
                        width: 30,
                        height: 30,
                      )),
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Image.asset(
                      "images/facebook.png",
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),

              SizedBoxMethod(30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont’s have an account? ",
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 12,
                        color: Color(0xff121826)),),

                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                           Get.to(() => RegisterScreen()) ;
                          },
                          child: Text("Sign up",
                                              style: TextStyle(
                          fontFamily: "poppins",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1599CE),
                                              )),
                        )
                ],
              ),

              
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _passwordTextController.text.length >= 6 &&
        _passwordTextController.text.length <= 30) {
      return true;
    }
    return false;
  }

  Future<void> _login() async {
    FireResponseClass b = await FireBaseConteroller().login(
        email: _emailTextController.text,
        password: _passwordTextController.text);
    if (b.status) {
      Get.offAll(() => ButtomNav());
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(b.message)));
    }
  }
}
