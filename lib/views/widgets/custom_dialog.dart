import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 26),
      title: Text(
        'Confirm Deletion',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      ),
      content: SizedBox(
        width: 500,
        child: Text(
          'Are you sure you want to delete this ?',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        CustomButton(width: 120, action: 'Delete', onTap: onTap),
        SizedBox(width: 20),
        CustomButton(
          width: 120,
          action: 'Cancel',
          onTap: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
