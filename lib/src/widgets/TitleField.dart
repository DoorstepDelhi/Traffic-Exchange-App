import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {
  final String text;
  TitleField({this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          width: 10.0,
        ),
        Icon(
          Icons.info_outline_rounded,
          size: 30.0,
        ),
      ],
    );
  }
}
