import 'package:flutter/material.dart';
import 'package:notes_app/views/add_note_view.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNoteView()));
        },
        backgroundColor: Colors.cyan,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 30, color: Colors.black),
      ),
    );
  }
}
