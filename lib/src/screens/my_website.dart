import 'package:ecommerce_app_ui_kit/src/models/notification.dart' as model;
import 'package:ecommerce_app_ui_kit/src/widgets/EmptyNotificationsWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/NotificationItemWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/GeneralButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/TableRowWidget.dart';

class MyWebsiteWidget extends StatefulWidget {
  @override
  _MyWebsiteWidgetState createState() => _MyWebsiteWidgetState();
}

class _MyWebsiteWidgetState extends State<MyWebsiteWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: GeneralButton(),
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: columnsWidth,
              children: [
                headRow(),
              ],
            ),
            ExpandablePanel(
              header: row(context, col1: 'Health2Offer'),
              hasIcon: false,
              expanded: expandRow(context),
            ),
            ExpandablePanel(
              header: row(context, col1: 'Insta Post'),
              hasIcon: false,
              expanded: expandRow(context),
            ),
            ExpandablePanel(
              header: row(context, col1: 'Portfolio Website'),
              hasIcon: false,
              expanded: expandRow(context),
            ),
          ],
        ),
      ),
    );
  }
}
