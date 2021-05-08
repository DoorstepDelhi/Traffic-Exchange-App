import 'package:ecommerce_app_ui_kit/provider/base_view.dart';
import 'package:ecommerce_app_ui_kit/services/navigation_service.dart';
import 'package:ecommerce_app_ui_kit/src/models/notification.dart' as model;
import 'package:ecommerce_app_ui_kit/src/screens/add_new_website.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/EmptyNotificationsWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/NotificationItemWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/GeneralButton.dart';
import 'package:ecommerce_app_ui_kit/view/website_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/TableRowWidget.dart';

class MyWebsiteWidget extends StatefulWidget {
  @override
  _MyWebsiteWidgetState createState() => _MyWebsiteWidgetState();
}

class _MyWebsiteWidgetState extends State<MyWebsiteWidget> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<WebsiteViewModel>(
      onModelReady: (model) => model.getWebsites(context),
      builder: (ctx, model, child) => Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: GeneralButton(
                  text: 'ADD NEW WEBSITE',
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddWebsiteWidget()));
                  },
                ),
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: columnsWidth,
                children: [
                  headRow(),
                ],
              ),
              for (int i = 0; i < model.initData.length; i++)
                // ExpandablePanel(
                row(context,
                    content: model.initData[i],
                    checkState: model.checkedWebsite[i], checkChange: (val) {
                  setState(() {
                    model.checkedWebsite[i] = val;
                  });
                }),
              //   hasIcon: false,
              //   expanded: expandRow(context, content: model.initData[i]),
              // ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: columnsWidth,
                children: [
                  secondHeadRow(),
                ],
              ),
              GestureDetector(
                onTap: () {
                  print('x');
                },
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Text(
                    'Remove Selected',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('y');
                },
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Text(
                    'Pause Selected',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('z');
                },
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Text(
                    'Unpause Selected',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
