import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/models/brand.dart';
import 'package:ecommerce_app_ui_kit/src/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/BrandsIconsCarouselWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/CategoriesIconsCarouselWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/CategorizedProductsWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/FlashSalesCarouselWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/FlashSalesWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/HitsChartWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/HomeSliderWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/RedeemHeaderWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/SearchBarWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/UserTrafficActivity.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/VisitedSitesChartWidget.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomeTrafficWidget extends StatefulWidget {
  @override
  _HomeTrafficState createState() => _HomeTrafficState();
}

class _HomeTrafficState extends State<HomeTrafficWidget>
    with SingleTickerProviderStateMixin {
  List<Product> _productsOfCategoryList;
  List<Product> _productsOfBrandList;
  CategoriesList _categoriesList = new CategoriesList();
  BrandsList _brandsList = new BrandsList();
  ProductsList _productsList = new ProductsList();

  Animation animationOpacity;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();

    _productsOfCategoryList = _categoriesList.list.firstWhere((category) {
      return category.selected;
    }).products;

    _productsOfBrandList = _brandsList.list.firstWhere((brand) {
      return brand.selected;
    }).products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBarWidget(),
          ),
          HomeSliderWidget(),
          UserTrafficActivity(),
          HitsChartWidget(),
          VisitedChartWidget(),
          RedeemHeaderWidget(),
          FlashSalesCarouselWidget(
              heroTag: 'home_flash_sales',
              productsList: _productsList.flashSalesList),
        ],
      ),
    );
//      ],
//    );
  }
}
