import 'package:ecommerce_app_ui_kit/enum/view_state.dart';
import 'package:ecommerce_app_ui_kit/provider/base_view.dart';
import 'package:ecommerce_app_ui_kit/src/models/website.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/GeneralButton.dart';
import 'package:ecommerce_app_ui_kit/view/website_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ShowFieldOnRadio.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/DrawerWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ShoppingCartButtonWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/TitleField.dart';

class AddWebsiteWidget extends StatefulWidget {
  @override
  _AddWebsiteWidgetState createState() => _AddWebsiteWidgetState();
}

class _AddWebsiteWidgetState extends State<AddWebsiteWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String limit = 'limit1';
  String source = 'direct';
  String target = 'all';
  bool checkState = false;
  int numb = 1;

  Website website = Website();

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: 2,
      child: BaseView<WebsiteViewModel>(
        onModelReady: (model) => model.getOneWebsite(context, id),
        builder: (ctx, model, child) => model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                key: _scaffoldKey,
                drawer: DrawerWidget(),
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  leading: new IconButton(
                    icon: new Icon(Icons.sort,
                        color: Theme.of(context).hintColor),
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    (id == null) ? 'Add New Website' : 'Edit Website',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  actions: <Widget>[
                    new ShoppingCartButtonWidget(
                        iconColor: Theme.of(context).hintColor,
                        labelColor: Theme.of(context).accentColor),
                    Container(
                        width: 30,
                        height: 30,
                        margin:
                            EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(300),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/Tabs', arguments: 1);
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage('img/user2.jpg'),
                          ),
                        )),
                  ],
                ),
                body: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TitleField(text: 'Enter Website Name'),
                      SizedBox(height: 10.0),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: model.nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: 'Enter Website Name',
                                labelStyle:
                                    Theme.of(context).textTheme.display4,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      TitleField(text: 'Enter Website Address'),
                      SizedBox(height: 10.0),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: model.urlController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: 'Enter Website Address',
                                labelStyle:
                                    Theme.of(context).textTheme.display4,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      TitleField(text: 'Daily Hits Limit'),
                      SizedBox(height: 10.0),
                      Container(
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: TabBar(
                          labelColor: Colors.white,
                          labelStyle: Theme.of(context).textTheme.headline4,
                          indicator: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                              )),
                          tabs: [
                            Tab(text: 'SAME LIMIT'),
                            Tab(text: 'RANDOM LIMIT')
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        child: TabBarView(
                          children: [
                            FirstTab(onChange: (value) {
                              model.dailyHitsController.text =
                                  value.round().toString();
                              // print(model.dailyHitsController.text);
                            }),
                            FirstTab(onChange: (value) {
                              model.dailyHitsController.text =
                                  value.round().toString();
                            }),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TitleField(text: 'Total Limit'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            RadioListTile(
                                title: Text(
                                  'Send as many hits as possible, as longs as I have Hits.',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                value: 'limit1',
                                groupValue: limit,
                                onChanged: (value) {
                                  model.totalHitsController =
                                      model.dailyHitsController;
                                  setState(() {
                                    limit = value;
                                  });
                                  print(limit);
                                }),
                            RadioListTile(
                                title: Text(
                                  'Stop traffic after a specific number of total hits.',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                value: 'limit2',
                                groupValue: limit,
                                onChanged: (value) {
                                  setState(() {
                                    limit = value;
                                  });
                                  print(limit);
                                }),
                            if (limit == 'limit2')
                              ShowFieldOnRadio(
                                  hint: 'Enter Number of hits',
                                  onChange: (value) {
                                    model.totalHitsController.text =
                                        value.toString();
                                    print(model.totalHitsController.text);
                                  }),
                            SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TitleField(text: 'Traffic Source'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            RadioListTile(
                                title: Text(
                                  'Direct',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                value: 'direct',
                                groupValue: source,
                                onChanged: (value) {
                                  model.trafficController.text = 'D';
                                  setState(() {
                                    source = value;
                                  });
                                }),
                            RadioListTile(
                              title: Text(
                                'Referral',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              value: 'refer',
                              groupValue: source,
                              onChanged: (value) {
                                model.trafficController.text = 'R';
                                setState(() {
                                  source = value;
                                });
                              },
                            ),
                            if (source == 'refer')
                              ShowFieldOnRadio(hint: 'Enter Referral Number'),
                            RadioListTile(
                              title: Text(
                                'Organic',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              value: 'organic',
                              groupValue: source,
                              onChanged: (value) {
                                model.trafficController.text = 'O';
                                setState(() {
                                  source = value;
                                });
                              },
                            ),
                            if (source == 'organic')
                              ShowFieldOnRadio(hint: 'Enter one keyword'),
                            RadioListTile(
                              title: Text(
                                'Social',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              value: 'social',
                              groupValue: source,
                              onChanged: (value) {
                                model.trafficController.text = 'S';
                                setState(() {
                                  source = value;
                                });
                              },
                            ),
                            if (source == 'social')
                              ShowFieldOnRadio(
                                  hint: 'Enter Social Media Platform'),
                            SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TitleField(text: 'Bounce Rate Reduction'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          title: Text('Enabled'),
                          leading: Checkbox(
                              value: checkState,
                              onChanged: (value) {
                                setState(() {
                                  checkState = !checkState;
                                });
                              }),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TitleField(text: 'Geo-Targeting'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            RadioListTile(
                                title: Text(
                                  'All States',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                value: 'all',
                                groupValue: target,
                                onChanged: (value) {
                                  setState(() {
                                    target = value;
                                  });
                                }),
                            RadioListTile(
                              title: Text(
                                'Specific State',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              value: 'specific',
                              groupValue: target,
                              onChanged: (value) {
                                setState(() {
                                  target = value;
                                });
                              },
                            ),
                            if (target == 'specific')
                              ShowFieldOnRadio(hint: 'Enter States'),
                            SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          model.state == ViewState.Busy
                              ? CircularProgressIndicator()
                              : PageButton(
                                  text: 'SUBMIT',
                                  onClick: () {
                                    print('y');
                                    if (id == null) {
                                      model.addWebsite(context);
                                    } else {
                                      model.editWebsite(context, id);
                                    }
                                  }),
                          PageButton(text: 'CANCEL', color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class PageButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onClick;
  PageButton({this.text, this.color, this.onClick});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title.merge(
                TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                ),
              ),
        ),
      ),
      color: color != null ? color : Theme.of(context).accentColor,
      shape: StadiumBorder(),
    );
  }
}

class FirstTab extends StatefulWidget {
  final Function onChange;
  FirstTab({this.onChange});
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  double _currentSliderValue = 1000.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 5000,
            divisions: 10,
            activeColor: Theme.of(context).accentColor,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              widget.onChange(value);
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${_currentSliderValue.round()} hits'),
              SizedBox(width: 25.0),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.lightbulb,
                color: Colors.grey,
              ),
              SizedBox(width: 10.0),
              Expanded(
                flex: 1,
                child: Text(
                  'This sets the highest limit. The actual delivery rate depends on supply & demand.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
