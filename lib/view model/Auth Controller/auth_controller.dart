import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/another_flashbar.dart';

class AuthController extends ChangeNotifier{

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance.collection('user');

  Signup(BuildContext context,String userName,String email,String password)async{
    try{
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value){
        db.doc(auth.currentUser!.uid).set({
          "userName" : userName,
          "email" : email,
        }).then((value){
          Flashbar().FlutterToast(context,"Your Data has been added");
        }).onError((error, stackTrace){
          Flashbar().FlutterToast(context,error.toString());
        });
        Flashbar().FlutterToast(context, value.toString());
      }).onError((error, stackTrace){
        Flashbar().FlutterToast(context, error.toString());
      });
    }catch(e){
      Flashbar().FlutterToast(context, e.toString());
    }
  }


}
