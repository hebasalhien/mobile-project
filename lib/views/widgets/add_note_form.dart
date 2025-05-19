import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/widgets/color_list_view.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, content;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          spacing: 40,
          children: [
            CustomTextField(
              title: 'Title',
              onSaved: (value) {
                title = value;
              },
            ),
            CustomTextField(
              title: 'Content',
              maxLines: 5,
              onSaved: (value) {
                content = value;
              },
            ),
            const ColorListView(),
            BlocBuilder<AddNotesCubit, AddNotesState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  width: MediaQuery.of(context).size.width,
                  action: 'Add',
                  onTap: () {
                    validateAddNote(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void validateAddNote(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var noteModel = NotesModel(
        color: Colors.blue.value,
        title: title!,
        content: content!,
        date: formatDate(),
      );
      BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  String formatDate() =>
      DateFormat.yMMMd('en_US').format(DateTime.now()).toString();
}
