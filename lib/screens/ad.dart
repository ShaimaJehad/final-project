import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AdScreen extends StatefulWidget {

 
  @override
  State<AdScreen> createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("AD")
                    .snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot data =
                                snapshot.data!.docs[index] ;
                            return AdWidget(
                              imageUrl: data['imageUrl'],
                              name: data['name'],
                              id: data['id'],
                            );
                          },
                        );
                }),
          ),
        ],
      ),
    );
  }
   
   
  }


class AdWidget extends StatelessWidget {
   late String name;
  late String imageUrl;
  late String id;

  AdWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.id,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(),
                image: DecorationImage(
                  
                  image: NetworkImage(imageUrl),
                )
                  
                  ),

              ),
              
            

            Positioned(
              bottom: 20,
              left: 20,
              child: Text(name)),
          ],
        ),
      ],
    );
  }
}