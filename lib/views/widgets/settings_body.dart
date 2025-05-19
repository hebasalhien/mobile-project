import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/change_theme_cubit/theme_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_dialog.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});
  
  @override
  Widget build(BuildContext context) {
    final isLightMode = context.watch<ThemeCubit>().state == ThemeMode.light;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 50,
        children: [
          SizedBox(),
          CustomAppBar(
            pageTitle: 'Settings',
            icon: Icons.home_filled,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.light_mode, size: 30),
            title: Text('Light Mode', style: TextStyle(fontSize: 24)),
            trailing: Switch(
              value: isLightMode,
              onChanged: (value) {
                BlocProvider.of<ThemeCubit>(context).toggleTheme(value);
              },
              activeColor: kPrimaryColor,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(FontAwesomeIcons.trash, size: 30),
            title: Text('Delete All notes', style: TextStyle(fontSize: 24)),
            trailing: CustomButton(
              width: 110,
              action: 'Delete',
              onTap: () {
                {
                  final notesCubit = BlocProvider.of<NotesCubit>(context);
                  showDialog<String>(
                    context: context,
                    builder:
                        (BuildContext dialogcontext) => CustomDialog(
                          onTap: () async {
                            await notesCubit.notesBox.clear();
                            Navigator.pop(dialogcontext);
                            notesCubit.getAllNotes();
                          },
                        ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
