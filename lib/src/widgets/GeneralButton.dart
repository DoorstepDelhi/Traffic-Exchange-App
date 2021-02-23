import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';

class GeneralButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton.icon(
        padding: EdgeInsets.symmetric(vertical: 12),
        onPressed: () {
          print('y');
        },
        icon: Icon(
          CupertinoIcons.plus,
          color: Colors.white,
          size: 32.0,
        ),
        label: Text(
          'ADD NEW WEBSITE',
          style: Theme.of(context).textTheme.title.merge(
                TextStyle(color: Theme.of(context).primaryColor),
              ),
        ),
        color: Theme.of(context).accentColor,
        shape: StadiumBorder(),
      ),
    );
  }
}
