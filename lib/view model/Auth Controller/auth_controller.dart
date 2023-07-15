import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_entry_data/view/Profile%20Data/profile_data.dart';

import '../../utils/another_flashbar.dart';

class AuthController extends ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance.collection('user');

  Signup(BuildContext context,String userName,String email,String password)async{
    setLoading(true);
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
          setLoading(false);
          Flashbar().FlutterToast(context,error.toString());
        });
        setLoading(false);
        Flashbar().FlutterToast(context, value.toString());
      }).onError((error, stackTrace){
        setLoading(false);
        Flashbar().FlutterToast(context, error.toString());
      });
    }catch(e){
      setLoading(false);
      Flashbar().FlutterToast(context, e.toString());
    }
  }

  Login(BuildContext context,String email,String password)async{
    setLoading(true);
   try{
     await auth.signInWithEmailAndPassword(
       email: email,
       password: password,
     ).then((value){
       setLoading(false);
       Flashbar().FlutterToast(context, value.toString());
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileData()));
     }).onError((error, stackTrace){
       setLoading(false);
       Flashbar().FlutterToast(context, error.toString());
     });
   }catch(e){
     Flashbar().FlutterToast(context, e.toString());
     setLoading(false);
   }
  }

}
