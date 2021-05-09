import 'package:ecommerce_app_ui_kit/src/models/website.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/GeneralButton.dart';
import 'package:flutter/material.dart';

Map<int, FlexColumnWidth> columnsWidth = {
  0: FlexColumnWidth(1),
  1: FlexColumnWidth(5),
  2: FlexColumnWidth(2),
  3: FlexColumnWidth(4)
};

TableRow headRow() {
  return TableRow(
    decoration: BoxDecoration(
      color: Color(0xffA6CEE3),
    ),
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Checkbox(
          value: false,
          onChanged: null,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Name ▼'),
      ),
      Text('Hits ▼'),
      Text('Status ▼'),
    ],
  );
}

TableRow secondHeadRow(BuildContext context) {
  return TableRow(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
    ),
    children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('Select Action ▼'),
      ),
    ],
  );
}

SingleChildScrollView row(BuildContext context,
    {Website content, bool checkState, Function checkChange}) {
  return SingleChildScrollView(
    child: Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: columnsWidth,
      children: [
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Checkbox(
                value: checkState,
                onChanged: checkChange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(content.name),
            ),
            Text(content.totalHits.toString()),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Theme.of(context).accentColor),
                  width: 70.0,
                  height: 20.0,
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'STATUS',
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.info_outline, color: Colors.black),
                  constraints: BoxConstraints(),
                  onPressed: null,
                  padding: EdgeInsets.zero,
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}

DataTable rowData(BuildContext context,
    {Website content, bool checkState, Function checkChange}) {
  return DataTable(rows: [
    DataRow(cells: [
      DataCell(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(content.name),
        ),
      ),
      DataCell(Text(content.totalHits.toString())),
      DataCell(
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Theme.of(context).accentColor),
              width: 70.0,
              height: 20.0,
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  'STATUS',
                  style: TextStyle(color: Colors.white, fontSize: 10.0),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.info_outline, color: Colors.black),
              constraints: BoxConstraints(),
              onPressed: null,
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      )
    ]),
  ]);
}

Widget expandRow(BuildContext context, model, {Website content}) {
  return Container(
    // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    height: 150,
    color: Color(0xFF737373),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content.url,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Daily Limit: ",
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                          text: "${content.dailyHits}/day",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ]),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Total Limit: ",
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                          text: content.totalHits.toString(),
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ]),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Bounce Reduction: ",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        TextSpan(
                          text: content.highQuality ? "Enabled" : "Disabled",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.all(5.0),
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {
                            print('yyyy');
                          },
                        ),
                        IconButton(
                          padding: EdgeInsets.all(5.0),
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.pause),
                          onPressed: () {
                            print('yyyy');
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.all(5.0),
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            print('yyyy');
                          },
                        ),
                        IconButton(
                          padding: EdgeInsets.all(5.0),
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.close),
                          onPressed: () {
                            print('del');
                            model.deleteWebsite(context, content.id);
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
