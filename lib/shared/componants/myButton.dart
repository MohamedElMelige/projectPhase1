import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  double height;
  double width;
  double size;
  final String text;
  final VoidCallback onPressed;
  final double radius;
   Color color;
   Color textColor;

  MyButton(
      { this.height=18,
      required this.onPressed,
       this.size=20,
      required this.text,
       this.width=18,
      this.radius = 15,
      this.color = Colors.green,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: onPressed,
      color: color,
      padding: EdgeInsets.symmetric(horizontal: height, vertical: height),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontSize: size, fontWeight: FontWeight.w600),
      ),
    );
  }
}
