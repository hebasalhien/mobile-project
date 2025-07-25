import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NoteInitial());
  List<NotesModel>? notes;
  var notesBox = Hive.box<NotesModel>(kNotesBox);

  getAllNotes() {
    notes = notesBox.values.toList();
    emit(NoteSuccess());
  }
}
