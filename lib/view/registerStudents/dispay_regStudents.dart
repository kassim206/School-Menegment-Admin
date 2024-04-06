import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisteredStudentsListPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        title: Text('Registered Students List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('registerStudent').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return Text('Error: ${snapshot.error ?? "No data available"}');
          } else {
            List<Map<String, dynamic>> studentsData = snapshot.data!.docs
                .map((doc) => {
              'name': (doc.data() as Map<String, dynamic>)['name'] ?? '',
              'text4': (doc.data() as Map<String, dynamic>)['text4'] ?? '',
            })
                .toList();

            return ListView.builder(
              itemCount: studentsData.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          studentsData[index]['name'] ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Text 4: ${studentsData[index]['text4'] ?? ''}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
