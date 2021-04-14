import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedeemWidget extends StatefulWidget {
  @override
  _RedeemWidgetState createState() => _RedeemWidgetState();
}

class _RedeemWidgetState extends State<RedeemWidget> {
  String number = '', amount = '';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Column(
        children: [
          Text(
            'Points shared will be converted to non-redeemable by default.',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                .merge(TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 10.0),
          TextField(txt: 'Enter Mobile Number', value: amount),
          SizedBox(height: 10.0),
          TextField(txt: 'Enter Amount', value: amount),
          SizedBox(height: 30.0),
          Expanded(
            // flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: NumericKeyboard(onKeyboardTap: null),
            ),
          ),
        ],
      ),
    );
  }
}

class TextField extends StatelessWidget {
  final String txt;
  final String value;
  TextField({this.txt, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        readOnly: true,
        showCursor: true,
        // showCursor: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: txt,
          labelStyle: Theme.of(context).textTheme.display4,
        ),
      ),
    );
  }
}
