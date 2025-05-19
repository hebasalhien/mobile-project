import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/widgets/display_note_view_body.dart';

class DisplayNoteView extends StatelessWidget {
  const DisplayNoteView({super.key, required this.note});
  final NotesModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DisplayNoteViewBody(note: note,));
  }
}
