

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_entry_data/utils/another_flashbar.dart';

class updataData extends ChangeNotifier{
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  final db  = FirebaseFirestore.instance.collection("user");
  final auth = FirebaseAuth.instance.currentUser;

  Update(BuildContext context,String industry,String location,String phoneNumber,String registration)async{
    try{
      setLoading(true);
      await db.doc(auth!.uid).update({
        "industry" : industry,
        "location" : location,
        "phoneNumber" : phoneNumber,
        "registration" : registration,
      }).then((value){
        setLoading(false);
        Flashbar().FlutterToast(context, "Update has Sucefully");
      }).onError((error, stackTrace){
        Flashbar().FlutterToast(context, error.toString());
        setLoading(false);
      });
    }catch(e){
      Flashbar().FlutterToast(context, e.toString());
      setLoading(false);
    }
  }
}