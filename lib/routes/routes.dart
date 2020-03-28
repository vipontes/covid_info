import 'package:covidinfo/view/chart/chart_page.dart';
import 'package:covidinfo/view/detail/detail_page.dart';
import 'package:covidinfo/view/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/home';
  static const String detail = '/detail';
  static const String chart = '/chart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case home:
        return CupertinoPageRoute(builder: (context) => HomePage());
      case detail:
        return CupertinoPageRoute(builder: (context) => DetailPage());
      case chart:
        return CupertinoPageRoute(builder: (context) => ChartPage());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

  static RouteSettings _createRouteSettings(String route, {Object data}) {
    return RouteSettings(name: route, arguments: data);
  }

  static void push(BuildContext context, String route, {Object data}) {
    Navigator.of(context).push(
      generateRoute(_createRouteSettings(route, data: data)),
    );
  }

  static void pushRemoveStack(BuildContext context, String route,
      {Object data}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        _createRouteSettings(route).name, (Route<dynamic> route) => false,
        arguments: data);
  }

  static void replace(BuildContext context, String route) {
    Navigator.of(context).pushReplacement(
      generateRoute(_createRouteSettings(route)),
    );
  }

  static void makeFirst(BuildContext context, String route) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
    Navigator.of(context).pushReplacement(
      generateRoute(_createRouteSettings(route)),
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
