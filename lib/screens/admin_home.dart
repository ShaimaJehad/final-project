import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AdmainHomeScreen extends StatefulWidget {
  const AdmainHomeScreen({super.key});

  @override
  State<AdmainHomeScreen> createState() => _AdmainHomeScreenState();
}

class _AdmainHomeScreenState extends State<AdmainHomeScreen> {

    List<String> categories = ["Design", "Programming", "Data Entery", "Cyber Security", "IT support", "Data management"];
    List<String> images_project= [
      "images/design.png",
      "images/programming.png",
      "images/data-entery.png",
      "images/cyber-security.png",
      "images/it-support.png",
      "images/data-management.png", 
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Hi,",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(" Find the person who will perform the task!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: "poppins",
                      fontWeight: FontWeight.normal)),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: SizedBox(
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: EdgeInsets.all(12),
                      hintText: "Search",
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w500),
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Color(0xff1599CE),
                        size: 28,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
            ),

            

                  Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: 370,
                    height: 340,
                    child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                       crossAxisSpacing: 20,
                       mainAxisSpacing: 1,
                       childAspectRatio: 3/2.7,
                    ), 
                                
                    itemBuilder: ((context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 135,
                            width: 180,
                            decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  
                                  Image.asset(images_project[index], width: 70, height: 66, fit: BoxFit.contain,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 13),
                                    child: Text(categories[index], style: TextStyle(fontFamily: 'poppins', fontWeight: FontWeight.w500, fontSize: 15),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                      
                      
                    })),
                  ),
                ),
              ),



          ]),
          ),


    );
    
    }
    }