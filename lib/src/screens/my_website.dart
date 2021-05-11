// import 'package:ecommerce_app_ui_kit/config/app_config.dart' as app;
import 'package:ecommerce_app_ui_kit/enum/view_state.dart';
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
      builder: (ctx, model, child) => model.state == ViewState.Busy
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
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
                    DataTable(
                      showBottomBorder: true,
                      showCheckboxColumn: true,
                      columnSpacing: 40.0,
                      headingRowHeight: 42.0,
                      headingRowColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.4);
                      }),
                      columns: [
                        DataColumn(
                          label: Text(
                            "Name ▼",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "Hits ▼",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "Status ▼",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          numeric: true,
                        ),
                      ],
                      rows: model.initData
                          .map(
                            (web) => DataRow(
                              selected: model.checkedWebsite.contains(web),
                              onSelectChanged: (e) {
                                setState(() {
                                  if (e) {
                                    model.checkedWebsite.add(web);
                                  } else {
                                    model.checkedWebsite.remove(web);
                                  }
                                });
                              },
                              cells: [
                                DataCell(Text(web.name)),
                                DataCell(Text(web.totalHits.toString())),
                                DataCell(
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            color:
                                                Theme.of(context).accentColor),
                                        width: 70.0,
                                        height: 20.0,
                                        child: MaterialButton(
                                          onPressed: () {},
                                          child: Text(
                                            "STATUS",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.info_outline,
                                            color: Colors.black),
                                        constraints: BoxConstraints(),
                                        onPressed: () {
                                          print('iconnn');
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) => expandRow(
                                              context,
                                              model,
                                              content: web,
                                            ),
                                            elevation: 50,
                                          );
                                        },
                                        padding: EdgeInsets.zero,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                    if (model.checkedWebsite.length > 0)
                      ExpandablePanel(
                        header: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: columnsWidth,
                          children: [
                            secondHeadRow(context),
                          ],
                        ),
                        hasIcon: false,
                        expanded: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                model.deleteSelectedWebsite(context);
                              },
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                child: Text(
                                  'Remove Selected',
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('y');
                                model.pauseSelectedWebsite(context);
                              },
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                child: Text(
                                  'Unpause Selected',
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}
