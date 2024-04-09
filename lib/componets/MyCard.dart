// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyCard extends StatelessWidget {
   MyCard({super.key, required this.index, required this.notemap,required this.onDelele});
  final int index;
  final Map notemap;
  final VoidCallback onDelele;

  @override
  Widget build(BuildContext context) {
     var box=Hive.box('Note');
   String title=notemap['title'];
   String details =notemap['details'];
    return Card (
      color: Colors.red,
      child: Column(
        children: [
          Text(title),
          Text(details)
        ],
      ),
    );
  }
}