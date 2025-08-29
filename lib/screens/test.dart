// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           bottom: TabBar(
//               unselectedLabelColor: Colors.redAccent,
//               indicatorSize: TabBarIndicatorSize.label,
//               indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.redAccent),
//               tabs: [
//                 Tab(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(color: Colors.redAccent, width: 1)),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text("APPS"),
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(color: Colors.redAccent, width: 1)),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text("MOVIES"),
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(color: Colors.redAccent, width: 1)),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text("GAMES"),
//                     ),
//                   ),
//                 ),
//               ]),
//         ),
//         body: TabBarView(children: [
//           Icon(Icons.apps),
//           Icon(Icons.movie),
//           Icon(Icons.games),
//         ]),
//       ));
//   }
// }