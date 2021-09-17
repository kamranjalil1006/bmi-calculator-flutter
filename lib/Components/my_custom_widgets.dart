import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReuseableWidget extends StatelessWidget {
  final Color? customColor;
  final Widget? customchild;
  final onPress;
  ReuseableWidget({required this.customColor, this.customchild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Material(
          elevation: 5,
          shadowColor: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: customColor,
            child: customchild,
          ),
        ),
      ),
    );
  }
}
