import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/models/brand.dart';
import 'package:ecommerce_app_ui_kit/src/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/BrandGridWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/DrawerWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ShoppingCartButtonWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/HomeSliderWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/UserTrafficActivity.dart';

import 'package:flutter/material.dart';

class SurfScreenWidget extends StatefulWidget {
  @override
  _SurfScreenWidgetState createState() => _SurfScreenWidgetState();
}

class _SurfScreenWidgetState extends State<SurfScreenWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  BrandsList _brandsList = new BrandsList();
  SubCategoriesList _subCategoriesList = new SubCategoriesList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: <Widget>[
            HomeSliderWidget(),
            UserTrafficActivity(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StackCard(
                    img: 'r1',
                    txt: 'Surf in Background',
                  ),
                  StackCard(
                    img: 'r2',
                    txt: 'Surf on Screen',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: RaisedButton(
                onPressed: () {
                  print('y');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Try Desktop Application',
                    style: Theme.of(context).textTheme.title.merge(
                          TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20.0),
                        ),
                  ),
                ),
                color: Theme.of(context).accentColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StackCard extends StatelessWidget {
  final String img, txt;
  StackCard({this.img, this.txt});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('img/$img.png'),
        Positioned(
          bottom: 5,
          child: RaisedButton(
            onPressed: () {
              print('y');
            },
            color: Theme.of(context).accentColor.withOpacity(0.8),
            child: Text(txt, style: TextStyle(fontSize: 11.0)),
          ),
        ),
      ],
    );
  }
}
