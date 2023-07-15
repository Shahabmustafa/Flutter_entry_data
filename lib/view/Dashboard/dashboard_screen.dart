


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_entry_data/view/Dashboard/add_data_entry.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final auth = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Stream documentSnapshot = FirebaseFirestore.instance.collection('user').doc(auth!.uid).snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
                stream: documentSnapshot,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    Map<String,dynamic> data = snapshot.data.data(); Map<String,dynamic>;
                    return Container(
                      height: 100,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${data['industry']}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                          SizedBox(
                            height: 5,
                          ),
                         ListTile(
                           title: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('Name :${data['userName']}',style: TextStyle(color: Colors.black),),
                               Text('Reg No :${data['registration']}',style: TextStyle(color: Colors.black),),
                             ],
                           ),
                           subtitle: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('Address :${data['location']}',style: TextStyle(color: Colors.black),),
                               Text('Phone No :${data['phoneNumber']}',style: TextStyle(color: Colors.black),),
                             ],
                           ),
                         ),
                        ],
                      ),
                    );
                  }else{
                    return CircularProgressIndicator();
                  }
                },
              )
          ),
          Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("user").doc(auth!.uid).collection('industryData').snapshots(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){
                          return Card(
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${snapshot.data!.docs[index]['Name']}',style: TextStyle(color: Colors.black),),
                                  Text('${snapshot.data!.docs[index]['Category']}',style: TextStyle(color: Colors.black),),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${snapshot.data!.docs[index]['phoneNumber']}',style: TextStyle(color: Colors.black),),
                                  Text('${snapshot.data!.docs[index]['CNICNumber']}',style: TextStyle(color: Colors.black),),
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  }else{
                    return CircularProgressIndicator();
                  }
                },
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EntryPage()));
          },
          label: Row(
            children: [
              Icon(Icons.add),
              Text('Add Entry'),
            ],
          )
      ),
    );
  }
}
