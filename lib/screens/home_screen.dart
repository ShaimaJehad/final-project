// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:project_flutter/screens/auth/login_widgets/widgets.dart';
import 'package:project_flutter/screens/categories.dart';
import 'package:project_flutter/screens/category_streambuilder.dart';
import 'package:project_flutter/screens/job_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  PageController controller = PageController();
  late TabController _tabController = TabController(length: 6, vsync: this);
  int selected_index = 0;

  // List _products = [];
  // var _firestoreInstance = FirebaseFirestore.instance;

  // fetchProducts() async {
  //   QuerySnapshot qn = await _firestoreInstance.collection("categories").get();
  //   setState(() {
  //     for (int i = 0; i < qn.docs.length; i++) {
  //       _products.add({
  //         "name": qn.docs[i]["name"],
  //       });
  //     }
  //   });

  //   return qn.docs;
  // }

  @override
  void initState() {
    
    // fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Container(
                  width: double.infinity,
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
                      Text(" Find Your Job!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  height: 60,
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


            //   Expanded(
            //   child: GridView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: _products.length,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2, childAspectRatio: 1),
            //       itemBuilder: (_, index) {
            //         return GestureDetector(
            //          // onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(_products[index]))),
            //           child: Card(
            //             elevation: 3,
            //             child: Text("${_products[index]["name"]}"),
            //           ),
            //         );
            //       }),
            // ),


              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.grey.shade200,
                    controller: _tabController,
                    isScrollable: true,
                    labelStyle: TextStyle(fontFamily: "poppins", fontSize: 18),
                    unselectedLabelStyle:
                        TextStyle(fontFamily: "poppins", fontSize: 17),
                    labelColor: Colors.white,
                    labelPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    indicatorPadding:
                        EdgeInsets.symmetric(horizontal: -15, vertical: 10),
                    unselectedLabelColor: Colors.grey.shade600,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Color(0xff1599CE),
                    ),

                  
                    tabs: [
                      Tab(text: "Design"),
                      Tab(text: "Programming"),
                      Tab(
                        text: "Data Entery",
                      ),
                      Tab(
                        text: "Cyber Security",
                      ),
                      Tab(
                        text: "IT support",
                      ),
                      Tab(
                        text: "Data management",
                      ),
                    ]),
              ),
              Expanded(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  child: TabBarView(

                    controller: _tabController, children: [
                    CategoryStreamBuilder(
                    
                      category_name: 'design',
                    ),
                    CategoryStreamBuilder(
                      category_name: 'programming',
                    ),
                    CategoryStreamBuilder(
                      category_name: 'data_entery',
                    ),
                    CategoryStreamBuilder(
                      category_name: 'cyber_security',
                    ),
                    CategoryStreamBuilder(
                      category_name: 'it_support',
                    ),
                    CategoryStreamBuilder(
                      category_name: 'data_management',
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



// CategoriesList(),
    
    
          // Expanded(
          //   child: StreamBuilder<QuerySnapshot>(
          //       stream: FirebaseFirestore.instance.collection("category").snapshots(),
          //       builder: (context, snapshot) {
          //         return !snapshot.hasData
          //             ? Center(child: CircularProgressIndicator())
          //             : ListView.builder(
          //                 itemCount: snapshot.data!.docs.length,
          //                 itemBuilder: (context, index) {
          //                   DocumentSnapshot data = snapshot.data!.docs[index];
          //                   return JobCategory(                      
          //                     imageUrl: data['imageUrl'],
          //                     name: data['name'],
                              
          //                   );
          //                 },
          //               );
          //       }
          //   ),
          // ),





      //  body: Column(
        
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [

      //                SizedBoxMethod(50),

      //               Padding(

      //                 padding: const EdgeInsets.all(10),
      //                 child: TextField(
      //                   decoration: InputDecoration(
      //                     hintText: 'Search',
      //                     prefixIcon: const Icon(Icons.search),
      //                     prefixIconColor: Colors.blue,
      //                     border: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(29.5),
      //                       borderSide: const BorderSide(
      //                         width: 1.0,
      //                         color: Color.fromARGB(255, 127, 90, 196),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               Expanded(
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 15),
      //             child: GridView.builder(
      //               itemCount: 6,
      //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2,
      //                crossAxisSpacing: 1,
      //                mainAxisSpacing: 10,
      //                childAspectRatio: 2/2,
      //             ), 
              
      //             itemBuilder: ((context, index) {
      //               return Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Container(
      //                     height: 135,
      //                     width: 120,
      //                     decoration: BoxDecoration(
      //                     border: Border.all(color: Colors.grey),
      //                     borderRadius: BorderRadius.circular(10),
      //                     ),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       crossAxisAlignment: CrossAxisAlignment.center,
      //                       children: [
                              
      //                         Image.asset("images/logo_job.jpg", width: 35, height: 35, fit: BoxFit.cover,),
      //                         Padding(
      //                           padding: const EdgeInsets.only(top: 5),
      //                           child: Text("data"),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               );
                    
                    
      //             })),
      //           ),
      //         ),
      //             ],
      //           ),
             
            
        
     


        // Expanded(
        //   child: PageView(
        //       controller: controller,
        //       onPageChanged: (value) {
        //         setState(() {
        //           selected_index = value;
        //           if(selected_index==0){
                    
        //           };
        //         });
        //         },
                
        //         children: [
        //           DesignJobs(),
        //           ProgrammingJobs(),
        //           DataEnteryJobs(),
        //           CyberSecurityJobs(),
        //           ItSupportJobs(),
        //           DataManagementJobs()
        //         ],
        //         ),
        // )
    
  
