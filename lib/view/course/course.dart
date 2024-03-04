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
                      TextFormField(controller: courseContoller,
                      ),
                      SizedBox(height: 60,),
                      ElevatedButton(
                        onPressed: () {
                          // Function to add data to Firebase Firestore
                          _addDataToFirestore();
                        },
                        child: Text("ADD"),
                        style: ElevatedButton.styleFrom(minimumSize: Size(600, 50)),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          width: h * 0.3,
          height: h * 0.25,
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
        width: h * 0.3,
        height: h * 0.22,
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.onSecondary,
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer,
            ],
            transform: const GradientRotation(pi / 4),
          ),
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
                    'Count',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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

