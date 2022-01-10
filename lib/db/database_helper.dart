import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_database/models/student_model.dart';

class DatabaseHelper{
  // Name constructor to create instance of database
  DatabaseHelper._privateConstructor();
  //we initialize the class DatabaseHelper
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  //this database give us actual date obj
  static Database _database;
  // getter for database
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }
  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/students.db';

    // open/ create database at a given path
    var studentsDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return studentsDatabase;
  }
  void _createDb(Database db, int newVersion) async {
    // the ''' used for multi line string
    await db.execute('''Create TABLE tbl_student (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  name TEXT,
                  course TEXT,
                  mobile TEXT, 
                  totalFee INTEGER, 
                  feePaid INTEGER )
    ''');
  }
  Future<int> insertStudent(StudentModel studentModel)async{
    Database db = await instance.database;
    var result = db.insert('tbl_student', studentModel.toMap());
    return result;
  }
  Future<List<StudentModel>> getAllStudent()async{
    var db = await instance.database;
    //this return list of maps
    var result = await db.query('tbl_student');
    //now we need list of students
    List<StudentModel> students = [];
    for(var jsonStudent in result){
      var s = StudentModel.fromMap(jsonStudent);
      students.add(s);
    }
    return students;

  }
  Future<int> deleteStudent(int id)async{
    Database db = await instance.database;
    //if there is more name=? course=? So in [id,name,course]
    var result = db.delete('tbl_student',where: 'id=?', whereArgs: [id.toString()]);
    return result;
  }
  Future<int> updateStudent(StudentModel s)async{
    Database db = await instance.database;
    return await db.update('tbl_student', s.toMap(),where: 'id=?',whereArgs: [s.id.toString()]);
  }
}