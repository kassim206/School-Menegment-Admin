import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/globel_variable.dart';

class EventCount extends StatelessWidget {
  const EventCount({Key? key}) : super(key: key);

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
        child: FutureBuilder<int>(
          future: _getPostCount(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              int count = snapshot.data ?? 0;
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
                    'Total No Events',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<int> _getPostCount() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('posts').get();
    return querySnapshot.size;
  }
}
