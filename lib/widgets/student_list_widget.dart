import 'package:flutter/material.dart';
import 'package:student_database/models/student_model.dart';
class StudentListWidget extends StatelessWidget {
  const StudentListWidget({
    Key key,
    @required this.s,
    @required this.voidCallback,
    @required this.onPressed,
  }) : super(key: key);

  final StudentModel s;
  final VoidCallback voidCallback;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.amber,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Student Name: ${s.name}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                ListTile(
                  leading: Text(
                    'Course:',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Text(
                    s.course,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  leading: Text(
                    'Mobile:',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Text(
                    s.mobile,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  leading: Text(
                    'TotalFee:',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Text(
                    s.totalFee,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  leading: Text(
                    'feePaid:',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Text(
                    s.feePaid,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text('Delete Data'),
                        onPressed: voidCallback,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text('Update Data'),
                        onPressed: onPressed,
                      ),
                    ),
                  ],
                ),
              ],
            )
        )
    );
  }
}