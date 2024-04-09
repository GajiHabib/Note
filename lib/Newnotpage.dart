// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/homepage.dart';

class NewNote extends StatefulWidget {
  int? Noteindex;
  NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  var box = Hive.box('Note');
  TextEditingController controllertitle = TextEditingController();
  TextEditingController controllerdetails = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.Noteindex != null) {
      Map mynote = box.getAt(widget.Noteindex!);
      controllertitle.text = mynote['title'];
      controllerdetails.text = mynote['details'];
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('New Note'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                String title = controllertitle.text;
                String details = controllerdetails.text;

                if (title.isEmpty || details.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Title or Details is missing')));
                } else {
                  Map NewNote = {'title': title, 'details': details};
                  if (widget.Noteindex != null) {
                    box.putAt(widget.Noteindex!, NewNote);
                  } else {
                    box.add(NewNote);
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homepage(),
                      ));
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: controllertitle,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Title'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: controllerdetails,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'details'),
                maxLines: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
