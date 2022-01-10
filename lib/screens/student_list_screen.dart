import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_database/db/database_helper.dart';
import 'package:student_database/models/student_model.dart';
import 'package:student_database/screens/updata_screen.dart';
import 'package:student_database/widgets/student_list_widget.dart';

class StudentListScreen extends StatefulWidget {
  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: FutureBuilder<List<StudentModel>>(
        future: DatabaseHelper.instance.getAllStudent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) {
              return Center(
                child: Text('No Students added yet'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var s = snapshot.data[index];
                  return StudentListWidget(s: s,
                      voidCallback: () {
                        return showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              backgroundColor: Colors.red,
                              title: Text(
                                'Confirmation!!!!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              content: Text(
                                'Are you sure to delete ?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              actions: [
                                TextButton(
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    int deleteResult = await DatabaseHelper
                                        .instance
                                        .deleteStudent(s.id);
                                    if (deleteResult > 0) {
                                      Fluttertoast.showToast(
                                        msg: 'Deleted successfully',
                                        textColor: Colors.red,
                                        toastLength: Toast.LENGTH_SHORT,
                                        fontSize: 20,
                                      );
                                      setState(() {

                                      });
                                    }
                                    Navigator.of(context).pop();
                                  },
                                ),

                              ],
                            );
                          },
                        );
                      },
                    onPressed: ()async{
                    //the pass message 'updated successfully' store in message
                      var message = await Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return UpdateScreen(studentUpdate: s);
                      }),);
                      if(message == 'Updated successfully'){
                        setState(() {
                        });
                      }
                    },
                  );
                },
              );
            }
          } else {
            return Center(
              child: Text('loading'),
            );
          }
        },
      ),
    );
  }
}
