import 'dart:async';

import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class RedeemHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        leading: Icon(
          UiIcons.megaphone,
          color: Theme.of(context).hintColor,
        ),
        title: Text(
          'Redeem',
          style: Theme.of(context).textTheme.display1,
        ),
        trailing: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/Home');
            },
            child: Text(
              'See more',
              style: Theme.of(context).textTheme.bodyText2,
            )),
      ),
    );
  }
}
