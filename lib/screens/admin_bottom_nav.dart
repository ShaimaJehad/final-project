import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_flutter/screens/admin_home.dart';
import 'package:project_flutter/screens/admin_order.dart';
import 'package:project_flutter/screens/admin_profile.dart';

class AdminBottomNav extends StatefulWidget {
  const AdminBottomNav({super.key});

  @override
  State<AdminBottomNav> createState() => _AdminBottomNavState();
}

class _AdminBottomNavState extends State<AdminBottomNav> {

  int currentIndex=0;

  List<Widget> pages =[
  AdmainHomeScreen(),
  AdminOrderScreen(),
  AdminProfileScreen(),
  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(                                                   
    borderRadius: BorderRadius.only(                                           
      topRight: Radius.circular(30), topLeft: Radius.circular(30)),            
    boxShadow: [                                                               
      BoxShadow(color: Colors.black38, spreadRadius: -4, blurRadius: 8,),       
    ],                                                                         
  ),   
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), ),
          child:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff1599CE),
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(fontSize: 1),
          selectedFontSize: 1,
          backgroundColor: Colors.white,
          unselectedIconTheme: IconThemeData(size: 26),
          iconSize: 30,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex= value;
            });
          },
          items: [
        
            BottomNavigationBarItem(
              icon:Icon(Icons.home_filled,),
              label: "",       
              
              ),
        
        
              BottomNavigationBarItem(
               icon:Icon(Icons.shopping_basket,),
              label: ""
              ),
        
              BottomNavigationBarItem(
               icon:Icon(Icons.person,),
              label: ""
              ),
          ] 
          
          ),
        ),
      ),
    );
  }
}