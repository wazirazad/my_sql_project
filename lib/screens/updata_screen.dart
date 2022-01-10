import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_database/db/database_helper.dart';
import 'package:student_database/models/student_model.dart';
class UpdateScreen extends StatefulWidget {
  final StudentModel studentUpdate;
  const UpdateScreen({Key key,@required this.studentUpdate}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var formKey = GlobalKey<FormState>();
  String name, course, mobile;
  int totalFee, feePaid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        title: Text('Update Student'),
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
                  //we initialValue to the update screen
                  initialValue: widget.studentUpdate.name,
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
                  initialValue: widget.studentUpdate.course,
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
                  initialValue: widget.studentUpdate.mobile,
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
                  initialValue: widget.studentUpdate.totalFee.toString(),
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
                  initialValue: widget.studentUpdate.feePaid.toString(),
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
                        child: Text('Update Record'),
                        onPressed: () async{
                          if (formKey.currentState.validate()) {
                            var updateSt = StudentModel(
                              id: widget.studentUpdate.id,
                              name: name,
                              course: course,
                              mobile: mobile,
                              totalFee: totalFee.toString(),
                              feePaid: feePaid.toString(),
                            );
                            int updateResult = await DatabaseHelper.instance.updateStudent(updateSt);
                            if (updateResult > 0) {
                              Fluttertoast.showToast(
                                msg: 'Updated successfully',
                                textColor: Colors.red,
                                toastLength: Toast.LENGTH_SHORT,
                                fontSize: 20,
                              );
                              //here we pass message to student list screen 'updated successfully'
                              Navigator.of(context).pop('Updated successfully');
                            }
                          }
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
