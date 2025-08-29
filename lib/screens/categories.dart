import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/screens/job_category.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  

  PageController controller = PageController();
  int selectedIndex = 0;

  final PageController pageController = PageController();

  List _products = [];
  List _jobs = [];

  var _firestoreInstance = FirebaseFirestore.instance;

  
  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("categories").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "name": qn.docs[i]["name"],
          
        });
      }
    });

    return qn.docs;
  }


  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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

              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _products.length,
                    itemBuilder: (context, index) => buildCategory(index),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: _products.length,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => buildPageView(index),
                ),
              ), 
              
              ],
                  ),
                ),
              
         
          );
    

    
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          controller.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color:
                selectedIndex == index ? Color(0xff1599CE) : Colors.grey.shade100,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Text(
              "${_products[index]["name"]}",
              style: TextStyle(
                fontSize: selectedIndex == index ? 18 : 17,
                fontFamily: "poppins",
                fontWeight:
                    selectedIndex == index ? FontWeight.w500 : FontWeight.normal,
                color:
                    selectedIndex == index ? Colors.white : Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPageView(int index) {
    return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection("categories")
        .doc(_products[index]['id']) // Assuming you have a 'categoryID' field in each product
        .collection("jobs")
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final docs = snapshot.data!.docs;
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final data = docs[index].data() as Map<String, dynamic>;
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
                 child: Image.network(_jobs[index]['imageUrl'], fit: BoxFit.fill,),
                 
                  )
              
                  
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

                  Text(
              _jobs[index]['name'],
              style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 19),
                  ),


                  SizedBox(height:4,),

                  Text(
              _jobs[index]['company'],
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
          },
        );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
      return Container(
        width: 100,
        height: 100,
        child: CircularProgressIndicator());
    },
  );
    
    // Container(
    //   color: Colors.blue, // Replace with your desired page content
    //   child: Center(
    //     child: Text(
    //       "${_products[index]["name"]}",
    //       style: TextStyle(fontSize: 24, color: Colors.white),
    //     ),
    //   ),
    // );
  }
}