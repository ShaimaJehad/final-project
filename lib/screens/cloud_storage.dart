import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'firestore_controller.dart';

class cloudStorage {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  upload({required String fileName, required File file}) async {
    try {
      // firebaseStorage.ref("test/" + fileName).putFile(file);
      UploadTask uploadTask =
          firebaseStorage.ref("test/" + fileName).putFile(file);

      String url = await uploadTask.snapshot.ref.getDownloadURL();
      FireStoreController()
          .firebaseFirestore
          .collection("myImages")
          .doc(uploadTask.snapshot.ref.name.split(".").first)
          .set({'image': url});
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future<String>? uploadImageProfile(
      {required String fileName, required File file}) {
    try {
      UploadTask uploadTask =
          firebaseStorage.ref("test/" + fileName).putFile(file);

      return uploadTask.snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<ListResult> getImages() async {
    List<String> list1 = [];
    final l = await firebaseStorage.ref("test/").listAll();

    return l;
  }

  Future<String> getDownload(ref) async {
    return await ref.getDownloadURL();
  }
}
