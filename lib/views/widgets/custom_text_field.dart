import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final bool isEnabled;
  const CustomTextField({
    super.key,
    required this.title,
    this.maxLines = 2,
    this.onSaved,
    this.onChanged,
    this.isEnabled = true
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      style: TextStyle(fontFamily: 'Poppins', fontSize: 22),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          //color: kPrimaryColor,
          fontSize: 24,
        ),
        enabledBorder: buildBorder(color: Colors.white),
        focusedBorder: buildBorder(color: kPrimaryColor),
        errorBorder: buildBorder(color: Colors.redAccent),
        focusedErrorBorder: buildBorder(color: Colors.redAccent),
      ),
      cursorColor: kPrimaryColor,
    );
  }

  OutlineInputBorder buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
