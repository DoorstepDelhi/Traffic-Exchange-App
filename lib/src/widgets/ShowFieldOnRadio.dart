import 'package:flutter/material.dart';

class ShowFieldOnRadio extends StatelessWidget {
  final String hint;
  final Function onChange;
  ShowFieldOnRadio({this.hint, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 75.0),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          width: 200.0,
          color: Colors.white,
          child: TextFormField(
            onChanged: (value) {
              onChange(value);
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              labelStyle: Theme.of(context).textTheme.display4,
            ),
          ),
        ),
      ],
    );
  }
}
