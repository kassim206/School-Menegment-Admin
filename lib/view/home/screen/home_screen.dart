import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_project/core/globel_variable.dart';

import '../../barchart/barchart.dart';
import '../../course/course.dart';
import '../../course/course_view.dart';
import '../../event/event_add.dart';
import '../../event/event_count.dart';
import '../../post/event_post.dart';
import '../../post/hom_postview.dart';
import '../../registerStudents/dispay_regStudents.dart';
import '../../registerStudents/registerStudent_count.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'ADMIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Add Events'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  PostUploding()));
              },
            ),
            ListTile(
              title: Text('Uploded Post'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  PostListPage()));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(w * 0.03),
                child: Text(
                  'Welcome to Admin!',
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.04,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Bounce(
                        onPressed: () {
                        },
                        duration: const Duration(milliseconds: 100),
                        child: EventCount(),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.025,
                    ),
                    Expanded(
                      child: Bounce(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CoursePage(),));
                        },
                        duration: const Duration(milliseconds: 100),
                        child: CourseCount(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Bounce(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisteredStudentsListPage(),));
                        },
                        duration: const Duration(milliseconds: 100),
                        child: RegisteredStudentsPage(),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.025,
                    ),
                    Expanded(
                      child: Bounce(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PostListPage()));
                        },
                        duration: const Duration(milliseconds: 100),
                        child:  postview(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Bounce(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ClubPage()));
                        },
                        duration: const Duration(milliseconds: 100),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PostUploding(),));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: w,
                              height: h * 0.18,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow:[
                                    BoxShadow(
                                        blurRadius: 2,
                                        spreadRadius: 0,
                                        color: Colors.grey.shade500,
                                        offset: Offset(5, 5)
                                    ),
                                  ]
                              ),
                              child: Center(child: Text("Add Events",style:
                              TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.black),)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.025,
                    ),
                    Expanded(
                      child: Bounce(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const ClubPage()));
                        },
                        duration: const Duration(milliseconds: 100),
                        child:  Course(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
