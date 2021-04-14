import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/models/brand.dart';
import 'package:ecommerce_app_ui_kit/src/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/BrandGridWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/DrawerWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ShoppingCartButtonWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/HomeSliderWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/UserTrafficActivity.dart';

import 'package:flutter/material.dart';

class CollaboratorsWidget extends StatefulWidget {
  @override
  _CollaboratorsWidgetState createState() => _CollaboratorsWidgetState();
}

class _CollaboratorsWidgetState extends State<CollaboratorsWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  BrandsList _brandsList = new BrandsList();
  SubCategoriesList _subCategoriesList = new SubCategoriesList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Collaborators',
          style: Theme.of(context).textTheme.display1,
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).hintColor,
              labelColor: Theme.of(context).accentColor),
          Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
              child: InkWell(
                borderRadius: BorderRadius.circular(300),
                onTap: () {
                  Navigator.of(context).pushNamed('/Tabs', arguments: 1);
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('img/user2.jpg'),
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Wrap(
          children: <Widget>[
            HomeSliderWidget(),
            SizedBox(
              child: Stack(
                children: <Widget>[
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .hintColor
                                    .withOpacity(0.10),
                                offset: Offset(0, 4),
                                blurRadius: 10)
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Theme.of(context).primaryColorDark,
                                Theme.of(context)
                                    .primaryColorDark
                                    .withOpacity(0.2),
                              ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 150.0,
                            height: 60.0,
                            child: RaisedButton(
                              onPressed: () {
                                print('y');
                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              color: Theme.of(context).accentColor,
                              child: Text(
                                'CONTACT US',
                                style: Theme.of(context).textTheme.title.merge(
                                      TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                              ),
                            ),
                          )
                        ],
                      )),
                  Positioned(
                    right: -40,
                    bottom: -60,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -30,
                    top: -60,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  )
                ],
              ),
            ),
            BrandGridWidget(brandsList: _brandsList),
          ],
        ),
      ),
    );
  }
}

// Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: <Widget>[
// Icon(
// UiIcons.bar_chart,
// color: Theme.of(context).primaryColor,
// size: 40,
// ),
// SizedBox(height: 5),
// Text(
// 'Conatact Us',
// style:
// TextStyle(color: Theme.of(context).primaryColor),
// )
// ],
// ),
