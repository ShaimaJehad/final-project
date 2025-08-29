import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/screens/job_category.dart';
import 'package:project_flutter/screens/job_details.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  PageController controller = PageController();
  int selectedIndex = 0;

  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> _jobs = [];

  var _firestoreInstance = FirebaseFirestore.instance;

  Future<void> fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("categories").get();
    setState(() {
      _products = qn.docs.reversed.map((doc) {
        return {
          "id": doc.id,
          "name": doc["name"],
          "jobs": <Map<String, dynamic>>[], // Initialize an empty list for jobs
        };
      }).toList();
    });

    // Fetch jobs for each category
    for (int i = 0; i < _products.length; i++) {
      QuerySnapshot jobsSnapshot = await _firestoreInstance
          .collection("categories")
          .doc(_products[i]['id'])
          .collection("jobs")
          .get();
      setState(() {
        _products[i]['jobs'] = jobsSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    }
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
              height: 25,
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
                    Text(
                      " Find Your Job!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
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
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17, left: 20),
              child: SizedBox(
                height: 45,
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
            color: selectedIndex == index
                ? Color(0xff1599CE)
                : Colors.grey.shade100,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Text(
              "${_products[index]["name"]}",
              style: TextStyle(
                fontSize: selectedIndex == index ? 18 : 17,
                fontFamily: "poppins",
                fontWeight: selectedIndex == index
                    ? FontWeight.w500
                    : FontWeight.normal,
                color: selectedIndex == index
                    ? Colors.white
                    : Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPageView(int index) {
    final jobs = _products[index]['jobs'] as List<Map<String, dynamic>>;

    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          child: ListTile(
            contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 25, right: 5),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
            tileColor: Colors.grey.shade100,
            title: Text(
              job['name'],
              style: TextStyle(
                fontFamily: "poppins",
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 19,
              ),
            ),
            subtitle: Text(
              job['company'],
              style: TextStyle(
                fontFamily: "poppins",
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                    child: Image.network(
                      job['imageUrl'],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              // Handle job details navigation
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobDetailsScreen(job)),
              );
            },
          ),
        );
      },
    );
    // final jobs = _products[index]['jobs'] as List<Map<String, dynamic>>;

    // return GestureDetector(
    //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>JobDetailsScreen(job))),
    //   child: ListView.builder(
    //     itemCount: jobs.length,
    //     itemBuilder: (context, index) {
    //       final job = jobs[index];

    //       return Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20, ),
    //         child: Container(
    //           width: double.infinity,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20),
    //             color: Colors.grey.shade100,
    //           ),
    //           child: Row(
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 20, right: 15, top: 17, bottom: 17),
    //                 child: CircleAvatar(
    //                   radius: 28,
    //                   child: ClipOval(
    //                     child: Image.network(
    //                       job['imageUrl'],
    //                       fit: BoxFit.fill,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     job['name'],
    //                     style: TextStyle(
    //                       fontFamily: "poppins",
    //                       fontWeight: FontWeight.w500,
    //                       color: Colors.black,
    //                       fontSize: 19,
    //                     ),
    //                   ),
    //                   SizedBox(height: 4,),
    //                   Text(
    //                     job['company'],
    //                     style: TextStyle(
    //                       fontFamily: "poppins",
    //                       color: Colors.grey,
    //                       fontSize: 15,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
