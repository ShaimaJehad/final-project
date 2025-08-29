// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


class JobCategory extends StatefulWidget {
  late String name;
  late String imageUrl;
  late String company;

  JobCategory({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.company,
  }) : super(key: key);

  @override
  State<JobCategory> createState() => _JobCategoryState();
}

class _JobCategoryState extends State<JobCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
          child: Container(
            
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade100,
            ),
            child: Row(
              
              children: [

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15, top: 17, bottom: 17),
                child: CircleAvatar(
                  radius: 28,
                  child: ClipOval(
                 child: Image.network(widget.imageUrl, fit: BoxFit.fill,),
                 
                  )
              
                  
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

                  Text(
              widget.name,
              style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 19),
                  ),


                  SizedBox(height:4,),

                  Text(
              widget.company,
              style: TextStyle(
                  fontFamily: "poppins",
                  color: Colors.grey,
                  fontSize: 15),
                  ),

                 
            ]  
            ),

              ]
          ),
          )
        ),
      ],
    
    );
  }
}
