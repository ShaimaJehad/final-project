import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_flutter/screens/sph.dart';

import 'FireResponseClass.dart';

class FireBaseConteroller {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Future<FireResponseClass> login({email, password}) async {
  //   return await firebaseAuth
  //       .signInWithEmailAndPassword(email: email, password: password)
  //       .then((value) {
  //     SharedPrefHelper().setData(value.user!.uid);
  //         if(value.user!.emailVerified){
  //           return FireResponseClass(status: true,message: "done");
  //         }
  //
  //     return FireResponseClass(status: false ,message: "virify your email");
  //   }).onError((error, stackTrace) => FireResponseClass(status: false,message: "someThing error"));
  // }

  Future<FireResponseClass> login({email, password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        SharedPrefHelper().setData(userCredential.user!.uid);
        if (userCredential.user!.emailVerified) {
          return FireResponseClass(status: true, message: "done");
        } else {
          userCredential.user!.sendEmailVerification();
          return FireResponseClass(
              status: false, message: "your email not verified");
        }
      }
      return FireResponseClass(status: false, message: "something wrong");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return FireResponseClass(
            status: false, message: 'No user found for that email.');
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return FireResponseClass(
            status: false, message: 'Wrong password provided for that user.');
        // print('Wrong password provided for that user.');
      } else if (e.code == 'wrong-email') {
        return FireResponseClass(
            status: false, message: 'Wrong email provided for that user.');
      }
    }
    return await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      SharedPrefHelper().setData(value.user!.uid);
      SharedPrefHelper().setData(value.user!.email);
      if (value.user!.emailVerified) {
        return FireResponseClass(status: true, message: "done");
      }

      return FireResponseClass(status: false, message: "virify your email");
    }).onError((error, stackTrace) =>
            FireResponseClass(status: false, message: "someThing error"));
  }

  Future<FireResponseClass> rigester({email, password}) async {
    return await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      value.user!.sendEmailVerification();
      SharedPrefHelper().setData(value.user!.uid);
      return FireResponseClass(status: true, message: "verify your email");
    }).onError((error, stackTrace) =>
            FireResponseClass(status: false, message: "someThing error"));
  }

  resetPassword({email}) async {
    try{
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return FireResponseClass(status: true,message: 'done');
    } on FirebaseAuthException catch(e){
      if(e.code == 'invalid-email'){
        return FireResponseClass(status: true,message: 'invalid email');
      }else {
        return FireResponseClass(status: true,message: e.message!);

      }
    }

  }
}
