import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final Function onClick;
  GeneralButton({this.text, this.onClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton.icon(
        padding: EdgeInsets.symmetric(vertical: 12),
        onPressed: onClick,
        icon: Icon(
          CupertinoIcons.plus,
          color: Colors.white,
          size: 32.0,
        ),
        label: Text(
          text,
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
