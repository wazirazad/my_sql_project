import 'package:flutter/material.dart';
import 'package:student_database/screens/add_student_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student DataBase',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.grey,
        appBarTheme: AppBarTheme(
          color: Colors.amberAccent,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        ),
      ),
      home: AddStudentScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

