

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_entry_data/utils/another_flashbar.dart';
import 'package:flutter_entry_data/view/Dashboard/dashboard_screen.dart';
import 'package:flutter_entry_data/view/Profile%20Data/profile_data.dart';

class updataData extends ChangeNotifier{
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  final db  = FirebaseFirestore.instance.collection("user");
  final auth = FirebaseAuth.instance.currentUser;
  final time = DateTime.now();

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
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardPage()));
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


  AddIndustryData(BuildContext context,String name,String phoneNumber,String cnicNumber,String Category,String Description)async{
   try{
     setLoading(true);
     await db.doc(auth!.uid).collection('industryData').add({
       "Name" : name,
       "phoneNumber" : phoneNumber,
       "CNICNumber" : cnicNumber,
       "Category" : Category,
       "Description" : Description,
       "time" : '$time',
     }).then((value){
       setLoading(false);
       Flashbar().FlutterToast(context, "Your are Eligible");
     }).onError((error, stackTrace){
       setLoading(false);
       Flashbar().FlutterToast(context, error.toString());
     });
   }catch(e){
     setLoading(false);
     Flashbar().FlutterToast(context, e.toString());
   }
  }
}