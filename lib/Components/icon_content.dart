import 'package:flutter/material.dart';
import 'my_constants.dart';

class IconContent extends StatelessWidget {
  final IconData myIcon;
  final String myText;
  IconContent(this.myIcon, this.myText);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myIcon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(myText, style: kMyTextStyle)
      ],
    );
  }
}
