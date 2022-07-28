import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double height;
  final double width;
  final double size;
  final String text;
  final VoidCallback onPressed;
  final double radius;
  final Color color;
  final Color textColor;

  MyButton(
      {required this.height,
      required this.onPressed,
      required this.size,
      required this.text,
      required this.width,
      this.radius = 15,
      this.color = Colors.indigo,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: onPressed,
      color: color,
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontSize: size, fontWeight: FontWeight.w600),
      ),
      padding: EdgeInsets.symmetric(horizontal: height, vertical: height),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }
}
