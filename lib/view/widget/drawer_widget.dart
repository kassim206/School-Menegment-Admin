import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drawer extends StatelessWidget {
  const Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      child: Icon(Icons.confirmation_num_sharp),
    );
  }
}
