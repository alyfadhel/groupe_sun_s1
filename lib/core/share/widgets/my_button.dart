import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final TextStyle? style;
  final double width;
  final Color background;
  final bool isUpperCase;

  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
    this.width = double.infinity,
    this.background = Colors.blue,
    this.isUpperCase = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10.0,),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase? text.toUpperCase() : text.toLowerCase(),
          style: style,
        ),
      ),
    );
  }
}
