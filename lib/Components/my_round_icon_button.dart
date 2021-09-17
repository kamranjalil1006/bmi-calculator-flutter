import 'package:flutter/material.dart';

class MyRoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  MyRoundIconButton(this.icon, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      elevation: 0.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
