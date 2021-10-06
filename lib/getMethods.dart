import 'package:flutter/material.dart';

class GetMethods {
  final Color _appBarColor = Color(0xC745e2c3);
  final String _appBarText = "NY Times Most Popular";

  Color getAppBarColor() {
    return _appBarColor;
  }

  String getAppBarTitle() {
    return _appBarText;
  }
}
