import 'package:app_clean/apresentacao/view/breaking_news_view.dart';
import 'package:flutter/material.dart';

class AppRotas {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(BreakingNewsView(key: UniqueKey()));
      default:
        return _materialRoute(const Scaffold());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
