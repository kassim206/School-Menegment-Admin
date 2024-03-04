import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/globel_variable.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: h*0.3,
        height: h*0.25,
        decoration: BoxDecoration(
            color: Colors.white,
            // gradient: LinearGradient(
            //     colors: [
            //       Theme.of(context).colorScheme.onSecondary,
            //       Theme.of(context).colorScheme.primaryContainer,
            //       Theme.of(context).colorScheme.primaryContainer,
            //       // Theme.of(context).colorScheme.primary,
            //     ],
            //     transform: const GradientRotation(pi /4 )
            // ),
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
    );
  }
}
