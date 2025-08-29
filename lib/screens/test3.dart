// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class Test3 extends StatefulWidget {
//   const Test3({super.key});

//   @override
//   State<Test3> createState() => _Test3State();
// }

// class _Test3State extends State<Test3> {

//   final List<String> items = ['Page 1', 'Page 2', 'Page 3']; // Sample list of items

//   final PageController pageController = PageController();

//   List _products = [];

//   var _firestoreInstance = FirebaseFirestore.instance;

  
//   fetchProducts() async {
//     QuerySnapshot qn = await _firestoreInstance.collection("categories").get();
//     setState(() {
//       for (int i = 0; i < qn.docs.length; i++) {
//         _products.add({
//           "name": qn.docs[i]["name"],
          
//         });
//       }
//     });

//     return qn.docs;
//   }

//   @override
//   void initState() {
//     fetchProducts();
//     super.initState();

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 15,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 22),
//                 child: Container(
//                   width: double.infinity,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         " Hi,",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 24,
//                           fontFamily: "poppins",
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(" Find Your Job!",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 18,
//                               fontFamily: "poppins",
//                               fontWeight: FontWeight.normal)),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: SizedBox(
//                   height: 60,
//                   child: TextField(
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.grey.shade100,
//                         contentPadding: EdgeInsets.all(12),
//                         hintText: "Search",
//                         hintStyle: TextStyle(
//                             fontSize: 18,
//                             color: Colors.grey,
//                             fontFamily: "poppins",
//                             fontWeight: FontWeight.w500),
//                         prefixIcon: Icon(
//                           Icons.search_outlined,
//                           color: Color(0xff1599CE),
//                           size: 28,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         )),
//                   ),
//                 ),
//               ),
              
//               SizedBox(
//                 height: 70, // Adjust the height as needed
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
//                   itemCount: _products.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       width: 190, // Adjust the width as needed
//                       margin: EdgeInsets.symmetric(horizontal: 8),
//                       child: ListTile(
//                         title: Text("${_products[index]["name"]}"),
//                         onTap: () {
//                           pageController.jumpToPage(index); // Jump to the selected page
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Expanded(
                
//                 child: PageView.builder(
//                   controller: pageController,
//                   itemCount: _products.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       color: Colors.blue, // Replace with your desired page content
//                       child: Center(
//                         child: Text(
//                           "${_products[index]["name"]}",
//                           style: TextStyle(fontSize: 24, color: Colors.white),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),

//             ]),
//         ),
//       ),
      
//     );
//   }
// }

