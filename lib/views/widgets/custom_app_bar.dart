import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.pageTitle, required this.icon, required this.onPressed});
  final String pageTitle;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          pageTitle,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Spacer(flex: 1),
        CustomIcon(icon: icon,onPressed: onPressed,),
      ],
    );
  }
}
