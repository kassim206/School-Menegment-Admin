import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import '../../core/globel_variable.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  TextEditingController courseContoller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: h * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: courseContoller,
                        decoration: InputDecoration(
                          labelText: 'Enter Course ',
                          hintText: 'Enter your course',
                          border: OutlineInputBorder( // Border styling
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          // You can add more decoration properties as needed
                        ),
                      ),
                      SizedBox(height: 60,),
                      ElevatedButton(
                        onPressed: () {
                          // Function to add data to Firebase Firestore
                          _addDataToFirestore();
                        },
                        child: Text("ADD" ,style: TextStyle(color: Colors.white),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo), // Set background color
                          minimumSize: MaterialStateProperty.all<Size>(Size(600, 50)), // Set minimum size
                          // You can add more styling properties here as needed
                        ),
                      )

                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          width: w,
          height: h * 0.18,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 0,
                color: Colors.grey.shade500,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              "Add Course",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addDataToFirestore() {
    // Add data to Firestore
    FirebaseFirestore.instance.collection('courses').add({
      'courseName': courseContoller.text, // Replace 'Course Name' with the actual course name
      // Add more fields as needed
    }).then((_) {
      // Data added successfully
      print("Data added to Firestore successfully");
    }).catchError((error) {
      // Error occurred while adding data
      print("Error adding data to Firestore: $error");
    });
  }
}

class CourseCount extends StatefulWidget {
  const CourseCount({Key? key}) : super(key: key);

  @override
  State<CourseCount> createState() => _CourseCountState();
}

class _CourseCountState extends State<CourseCount> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: w,
        height: h * 0.18,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 0,
              color: Colors.grey.shade500,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('courses').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show loading indicator while waiting for data
              }

              // Get count of documents in the collection
              int count = snapshot.data!.size;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$count',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    'Total No Course',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

