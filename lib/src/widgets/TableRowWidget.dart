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

Table row(BuildContext context, {String col1}) {
  return Table(
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    columnWidths: columnsWidth,
    children: [
      TableRow(
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
            child: Text(col1),
          ),
          Text('0'),
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
  );
}

Widget expandRow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'www.google.com/',
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
                        text: "5000/day",
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
                        text: "∞",
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
                        text: "Disabled",
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
                      Icon(Icons.remove_red_eye),
                      Icon(Icons.pause),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.edit),
                      Icon(Icons.close),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
