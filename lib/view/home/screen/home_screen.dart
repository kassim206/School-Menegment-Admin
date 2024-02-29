import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/core/globel_variable.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Drawer(
            width: w*0.2,
          backgroundColor: const Color(0xFF2697FF),
      child: ListView(
        children: [
          DrawerHeader(
          child: Icon(Icons.confirmation_num_sharp),
          ),
        ],
      ),
    ),
          Expanded(
            // color: Colors.greenAccent,
            // width:w*0.7,
            // height: h*0.8,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Container(
                          width: h*0.3,
                          height: h*0.3,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Container(
                          width: h*0.3,
                          height: h*0.3,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Container(
                          width: h*0.3,
                          height: h*0.3,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Container(
                          width: h*0.3,
                          height: h*0.3,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Container(
                          width: h*0.3,
                          height: h*0.3,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
