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
      child: Container(
        decoration: BoxDecoration(
          color: customColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(10),
        child: customchild,
      ),
    );
  }
}
