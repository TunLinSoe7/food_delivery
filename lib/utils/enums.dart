import 'package:flutter/cupertino.dart';
import 'package:food_order_demo/pages/history_page.dart';
import 'package:food_order_demo/pages/home_page.dart';
import 'package:food_order_demo/pages/profile_page.dart';
import '../pages/order_page.dart';

// ignore: constant_identifier_names
enum Fruit { WavePay, Kpay }

enum LoadingState { loading, complete, error }

enum Pages {
  homePage,
  orderPage,
  historyPage,
  profilePage,
}

extension Page on Pages {
  Widget get pages {
    switch (this) {
      case Pages.homePage:
        return const HomePage();
      case Pages.orderPage:
        return const OrderPage();
      case Pages.historyPage:
        return const HistoryPage();
      case Pages.profilePage:
        return const ProfilePage();
      default:
        return Container();
    }
  }
}
