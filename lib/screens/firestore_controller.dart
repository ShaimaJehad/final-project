import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_flutter/screens/job_model.dart';
import 'package:project_flutter/screens/sph.dart';

import 'my_user.dart';

class FireStoreController{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  newUser({required MyUser user}){
    firebaseFirestore.collection("users").doc(user.id).set(user.toMap());
    // firebaseFirestore.collection("users").add(user.toMap());
  }

  updateUser({required MyUser user}){
    firebaseFirestore.collection("users").doc(user.id).update(user.toMap());
    // firebaseFirestore.collection("users").add(user.toMap());
  }

  deleteUser({id}){
    firebaseFirestore.collection("users").doc(id).delete();
    // firebaseFirestore.collection("users").add(user.toMap());
  }

  Future<MyUser> readUser() async {
    //select * from user where id = 1
    DocumentSnapshot snapshot = await firebaseFirestore.collection("users").doc(SharedPrefHelper().getData()).get();

   print(snapshot.data());
   return MyUser.fromMap(snapshot.data());

  }

  readUsers(){
    firebaseFirestore.collection("users").get();
    //select * from user where id = 1
    // firebaseFirestore.collection("users").add(user.toMap());
  }



  Future<JobModel> readCategory()  async {
    //select * from user where id = 1
    DocumentSnapshot snapshot = await firebaseFirestore.collection("categories").doc(SharedPrefHelper().getData()).get();

   print(snapshot.data());
   return JobModel.fromMap(snapshot.data());

  }

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
Future<void> updateUserProfilePicture(PickedFile imageFile) async {
    if (imageFile == null) return;

    try {
      String userId = firebaseAuth.currentUser?.uid ?? '';
      if (userId.isNotEmpty) {
        String imagePath = 'profile_pictures/$userId.jpg';

        // Upload the image to Cloud Storage
        final Reference storageReference =
            FirebaseStorage.instance.ref().child(imagePath);
        await storageReference.putFile(File(imageFile.path));

        // Get the download URL of the uploaded image
        String imageUrl = await storageReference.getDownloadURL();

        // Update the user's profile picture URL in Firestore
        await firebaseFirestore
            .collection('users')
            .doc(userId)
            .update({'profilePicture': imageUrl});
      }
    } catch (e) {
      print('Error updating profile picture: $e');
    }
  }
  

  
}