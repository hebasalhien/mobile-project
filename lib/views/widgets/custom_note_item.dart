import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/display_note_view.dart';
import 'package:notes_app/views/widgets/custom_dialog.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.notesModel});
  final NotesModel notesModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DisplayNoteView(note: notesModel,)),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 28, bottom: 28, left: 16),
        decoration: BoxDecoration(
          color: Color(notesModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(notesModel.title, style: TextStyle(fontSize: 36)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  notesModel.content,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black.withValues(alpha: .5),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  final notesCubit = BlocProvider.of<NotesCubit>(context);
                  showDialog<String>(
                    context: context,
                    builder:
                        (BuildContext dialogcontext) => CustomDialog(
                          onTap: () {
                            
                            notesModel.delete();
                            Navigator.pop(dialogcontext);
                            notesCubit.getAllNotes();
                          },
                        ),
                  );
                },
                icon: Icon(FontAwesomeIcons.trash, size: 30),
              ),

              textColor: Colors.black,
              iconColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, top: 12),
              child: Text(
                notesModel.date,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black.withValues(alpha: .5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
