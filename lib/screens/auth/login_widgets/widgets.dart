import 'package:flutter/material.dart';



SizedBox SizedBoxMethod(double height_sizedbox) {
    return SizedBox(
                width: double.infinity,
                height: height_sizedbox,
              );
  }


  Text MainTextMethod1(String text) {
    return Text(text,
    
                style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    
              );
  }

  Text MainTextMethod2(String text) {
    return Text(text,
                style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 24,
                    color: Color(0xff1599CE),
                    fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
              );
  }


  Text ScoundTextMethod(String text) {
    return Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 13,
                    color: Color(0xff6C727F),
                    ),
              );
  }



    Padding PaddingElevatedButton(double right_padding, double left_padding, double button_width, double button_height, double border_radius, Color background_button_Color, String text, Color text_color) {
    return Padding(
                padding: EdgeInsets.only(right: right_padding, left: left_padding),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(button_width, button_height),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(border_radius),
                    ),
                    shadowColor: Color(0xff000000),
                    backgroundColor: background_button_Color,
                    elevation: 0,
                    //side: BorderSide(color: Color(0xff000000), width: 0.3),
                  ),
                  onPressed: () {},
                  child: Text(
                    text,
                    style: TextStyle(
                        color: text_color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins"),
                  ),
                ),
              );
  }


    
