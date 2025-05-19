import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_button.dart';

class DisplayNoteViewBody extends StatelessWidget {
  const DisplayNoteViewBody({super.key, required this.note});
  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 50,
        children: [
          SizedBox(),
          CustomAppBar(
            pageTitle: 'Note',
            icon: Icons.home,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(note.title, style: TextStyle(fontSize: 36)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(note.content, style: TextStyle(fontSize: 22)),
            ),
          ),
          SizedBox(height: 100),
          CustomButton(
            width: MediaQuery.of(context).size.width,
            action: 'Edit Note',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNoteView(note: note),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
