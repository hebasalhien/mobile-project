import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        shape: BoxShape.rectangle,
        color: Colors.white.withValues(alpha: .1),
      ),
      alignment: Alignment.center,
      child: IconButton( onPressed: onPressed, icon: Icon(icon,size: 28,),),
    );
  }
}
