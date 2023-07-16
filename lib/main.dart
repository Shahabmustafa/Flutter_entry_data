import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_entry_data/firebase_options.dart';
import 'package:flutter_entry_data/view/Auth/login_screen.dart';
import 'package:flutter_entry_data/view/Dashboard/dashboard_screen.dart';

import 'res/color.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final auth = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorApp.primaryColor,
          // color: ColorApp.primaryColor,
          centerTitle: true,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorApp.primaryColor,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
          titleMedium: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),
          titleSmall: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),
        )
      ),
      home: auth != null ? LoginScreen() : DashBoardPage(),
    );
  }
}
