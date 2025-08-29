import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaddingTextField extends StatelessWidget {

  PaddingTextField({
    Key? key,
    required this.left_padding,
    required this.right_padding,
    required this.bottom_padding,
    required this.prefix_image,
    required this.hint_text,
    required this.textController,
    required this.type_input,
    required this.scure,
  }) : super(key: key);


  double left_padding;
  double right_padding;
  double bottom_padding;
  String prefix_image;
  //String label_text;
  String hint_text;
  TextEditingController textController;
  TextInputType type_input;
  bool scure;



  @override
  Widget build(BuildContext context) {
    return Padding(
                padding:  EdgeInsets.only(left: left_padding, bottom: bottom_padding, right: right_padding),
                child: SizedBox(
                  height: 58,
                  child: TextField(
                    obscureText: scure,
                    keyboardType: TextInputType.multiline,
                    controller: textController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff1599CE),
                        ),
                        borderRadius: BorderRadius.circular(24),
                        ) ,
                
                      prefixIcon: Image(
                        image: AssetImage(prefix_image),
                        height: 26,
                        width: 26,
                        
                      ),
                
                      // label: Text(widget.label_text),
                      // labelStyle: TextStyle(
                      //   backgroundColor: Color(0xffFFFFFF),
                      //   color: widget.color,
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.w500,
                      //   fontFamily: "manrope"),
                        
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.25, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)
                      ),
                
                      hintText: hint_text,
                      hintTextDirection: TextDirection.ltr,
                      
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6C727F),
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              );
  }
}