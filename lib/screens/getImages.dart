import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/screens/cloud_storage.dart';

class GetImages extends StatefulWidget {
  @override
  State<GetImages> createState() => _GetImagesState();
}

class _GetImagesState extends State<GetImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<ListResult>(
          future: cloudStorage().getImages(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return FutureBuilder<String>(
                            future:  cloudStorage().getDownload(snapshot.data!.items[index]),
                            builder: (context, snapshot) {
                              if(snapshot.connectionState == ConnectionState.waiting){
                                return Dialog(
                                    child: Center(
                                  child: CircularProgressIndicator(),
                                ));
                              } else {
                                return  Dialog(
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(snapshot.data!)
                                        )
                                    ),
                                  ),
                                );
                              }

                            },

                          );
                        },
                    );
                  },
                    child:
                Text(snapshot.data!.items[index].name));
              },
            );
          },
        ));
  }
}
