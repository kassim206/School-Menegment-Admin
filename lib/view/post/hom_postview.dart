import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import '../../core/globel_variable.dart';

class postview extends StatefulWidget {
  const postview({super.key});

  @override
  State<postview> createState() => _postviewState();
}

class _postviewState extends State<postview> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          "View Events",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}


