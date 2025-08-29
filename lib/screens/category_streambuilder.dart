import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/screens/job_category.dart';

class CategoryStreamBuilder extends StatelessWidget {
  
  
  late String category_name;

  CategoryStreamBuilder({
    Key? key,
    required this.category_name,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(category_name)
                  .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data =
                              snapshot.data!.docs[index] ;
                          return JobCategory(
                            imageUrl: data['imageUrl'],
                            name: data['name'],
                            company: data['company'],
                          );
                        },
                      );
              }),
        ),
      ],
    );
  }
}
