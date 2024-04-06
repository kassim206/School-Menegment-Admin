import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/globel_variable.dart';

class RegisteredStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<int>(
        future: getRegisteredStudentsCount(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return  Container(
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
              child:   Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' ${snapshot.data}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    'Total Registered Students',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<int> getRegisteredStudentsCount() async {
    // Fetch documents from Firestore collection
    QuerySnapshot querySnapshot = await _firestore.collection('registerStudent').get();
    // Return the total number of documents (students)
    return querySnapshot.docs.length;
  }
}
