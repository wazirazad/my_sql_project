import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_database/db/database_helper.dart';
import 'package:student_database/models/student_model.dart';
import 'package:student_database/screens/student_list_screen.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  var formKey = GlobalKey<FormState>();
  String name, course, mobile;
  int totalFee, feePaid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'name',
                    labelText: 'name',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    name = value;
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return 'please provide Name';
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'course',
                    labelText: 'course',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      course = value;
                      return null;
                    } else {
                      return 'please provide Course';
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    //hide mixNumber
                    counterStyle: TextStyle(
                      height: double.minPositive,
                    ),
                    counterText: '',
                    hintText: 'mobile',
                    labelText: 'mobile',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      mobile = value;
                      return null;
                    } else {
                      return 'please provide mobile Number';
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'totalFee',
                    labelText: 'totalFee',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      totalFee = int.parse(value);
                      return null;
                    } else {
                      return 'please provide totalFee';
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'feePaid',
                    labelText: 'feePaid',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      feePaid = int.parse(value);
                      return null;
                    } else {
                      return 'please provide feePaid';
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          side: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                        child: Text('Save Record'),
                        onPressed: () async{
                          if (formKey.currentState.validate()) {
                            //we take student form model class insert
                            var s = StudentModel(
                                name: name,
                                course: course,
                                mobile: mobile,
                                totalFee: totalFee.toString(),
                                feePaid: feePaid.toString(),
                            );
                           int result = await DatabaseHelper.instance.insertStudent(s);
                           if(result >0){
                             formKey.currentState.reset();
                             Fluttertoast.showToast(
                               msg: 'Save SuccessFully',
                               backgroundColor: Colors.green,
                               fontSize: 20,
                             );
                           }else{
                             Fluttertoast.showToast(
                               msg: 'Not Save',
                               backgroundColor: Colors.red,
                               fontSize: 20,
                             );
                           }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          side: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                        child: Text('View Record'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                            return StudentListScreen();
                          },),);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
