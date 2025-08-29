import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/admin_user.dart';
import 'my_widget.dart';

class OnBoarding1 extends StatefulWidget {

  String image;
  String title;
  String subTitle1;
  String subTitle2;

  OnBoarding1({required this.image, required this.title, required this.subTitle1, required this.subTitle2});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  var selected_index;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
      child: Center(
        

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              SizedBox(
                height: 70,
              ),
              
              SizedBox(
                width: 280,
                height: 210,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.fill,
                      ),
                      ),
                ),
              ),
        
              


        //       Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     BuildCircleAvatar(0, selected_index),
        //     Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 10),
        //         child: BuildCircleAvatar(1, selected_index)),
        //     BuildCircleAvatar(2, selected_index)
        //   ],
        // ),



        
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         CircleAvatar(
              //           radius: 5,
              //           backgroundColor: Color(0xffD7D9DB),
              //         ),

              //         Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 10),
              //           child: CircleAvatar(
              //             radius: 5,
              //             backgroundColor: Color(0xffD7D9DB),
              //           ),
              //         ),
              //         CircleAvatar(
              //           radius: 5,
              //           backgroundColor: Color(0xffD7D9DB),
              //         ),

              //       ],
              //     ),

                  SizedBox(
                    height: 20,
                  ),

                  Text(widget.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, fontFamily: "poppins"),),
                  Padding(
                    padding: const EdgeInsets.only(top: 11, bottom: 4),
                    child: Text(widget.subTitle1, style: TextStyle(fontSize: 14, fontFamily: "poppins", color: Color(0xff959BA4)),),
                  ),
                  Text(widget.subTitle2, style: TextStyle(fontSize: 14, fontFamily: "poppins", color: Color(0xff959BA4))),

                  SizedBox(
                    height: 90,
                  ), 


                  ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                    
                      backgroundColor: Color(0xff1599CE),
                      shadowColor: Color(0xff1599CE),
                      elevation: 10,
                      fixedSize: Size.fromRadius(25),
                      shape: CircleBorder(),
                      
                    ),
                    onPressed: (() {
                    

                  }), 
                  child: Icon(Icons.arrow_forward,
                   size: 27,
                    ),
                  
                    ),

                    SizedBox(
                      height:5,
                    ),

                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Get.off(() => AdminOrUser());
                      },
                      child: Text("Skip", style: TextStyle(fontSize: 15, fontFamily: "poppins", color: Color.fromARGB(255, 123, 192, 220) ),)),




            ],
          ),
        ),
      ),
    




    );
  }
}