import 'package:flutter/material.dart';

class UserTrafficActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        children: [
          Column(
            children: [
              CircleAvatar(
                child: Center(
                  child: Text(
                    '290',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                radius: 30,
                backgroundColor: Theme.of(context).accentColor,
              ),
              SizedBox(
                height: 4,
              ),
              Text('Points Earned'),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                child: Center(
                  child: Text(
                    '290',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                radius: 30,
                backgroundColor: Theme.of(context).accentColor,
              ),
              SizedBox(
                height: 4,
              ),
              Text('Data Used'),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                child: Center(
                  child: Text(
                    '290',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                radius: 30,
                backgroundColor: Theme.of(context).accentColor,
              ),
              SizedBox(
                height: 4,
              ),
              Text('Sites Visited'),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                child: Center(
                  child: Text(
                    '290',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                radius: 30,
                backgroundColor: Theme.of(context).accentColor,
              ),
              SizedBox(
                height: 4,
              ),
              Text('Hits Received'),
            ],
          )
        ],
      ),
    );
  }
}
