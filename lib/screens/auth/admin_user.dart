import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:project_flutter/screens/admin_bottom_nav.dart';
import 'package:project_flutter/screens/admin_home.dart';
import 'package:project_flutter/screens/auth/login_screen.dart';
import 'package:project_flutter/screens/user_buttom_nav.dart';

import 'login_widgets/widgets.dart';

class AdminOrUser extends StatefulWidget {
  const AdminOrUser({super.key});

  @override
  State<AdminOrUser> createState() => _AdminOrUserState();
}

class _AdminOrUserState extends State<AdminOrUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

          child: ListView(
      
        children: [

          SizedBox(
            height: 55,
            width: double.infinity,),


          // Container(
          // width: 150,
          // height: 150,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("images/logo_job.jpg"),
          //   ),
          // ),
          //                   ),

          Text("Welcome!",
                style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 28,
                    color: Color(0xff1599CE),
                    fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
              ),

          
          SizedBox(height: 5,),
          
          ScoundTextMethod("Sign in as:"),

          


          SizedBox(
            height: 35,
            width: double.infinity,),



          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
             Get.to(() => AdminBottomNav());
            },
            child: Image(
              image: AssetImage("images/admin.png"),
              height: 200,
              width: 200,
            ),
          ),
          
          Text("ـــــــــــــــ OR ـــــــــــــــ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 14,
                    color: Colors.grey,
                    ),
          ),
          
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
            Get.to(() => LoginScreen());  
            },
            child: Image(
              image: AssetImage("images/girl.png"),
              height: 200,
              width: 200,
            ),
          ),
        ],
      )),
    );
  }
}
