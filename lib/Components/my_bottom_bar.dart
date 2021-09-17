import 'package:flutter/material.dart';
import 'my_constants.dart';

class MyBottomBar extends StatelessWidget {
  final onPressed;
  final String barText;

  MyBottomBar({required this.barText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.all(5),
        width: double.infinity,
        height: kBottomBarheight,
        child: Center(
          child: Text(
            barText,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
