// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, body_might_complete_normally_nullable, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/Newnotpage.dart';
import 'package:noteapp/componets/MyCard.dart';
import 'package:noteapp/componets/Notenotfaund.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  get notemap => null;

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('Note');
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewNote(),
                ));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Center(
              child: Text(
            'Note',
            style: TextStyle(fontSize: 50),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              box.isEmpty
                  ? const NoteNotFoundWidget()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (context, index) {
                          Map NewNote = box.getAt(index);
                          return MyCard(
                              index: index,
                              notemap: notemap,
                              onDelele: () {
                                setState(() {});
                              });
                        },
                      ),
                    )
            ],
          ),
        ));
  }
}
