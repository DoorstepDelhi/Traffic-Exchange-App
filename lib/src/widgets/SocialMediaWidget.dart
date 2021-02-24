import 'package:ecommerce_app_ui_kit/src/screens/collaborators.dart';
import 'package:ecommerce_app_ui_kit/src/screens/company.dart';
import 'package:ecommerce_app_ui_kit/src/screens/surf_screen.dart';
import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 45,
          height: 45,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CollaboratorsWidget(),
                ),
              );
            },
            child: Image.asset('img/facebook.png'),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 45,
          height: 45,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SurfScreenWidget(),
                ),
              );
            },
            child: Image.asset('img/twitter.png'),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 45,
          height: 45,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompanyWidget(),
                ),
              );
            },
            child: Image.asset('img/google-plus.png'),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 45,
          height: 45,
          child: InkWell(
            onTap: () {},
            child: Image.asset('img/linkedin.png'),
          ),
        )
      ],
    );
  }
}
