import 'package:flutter/material.dart';

class HomeScreenModel {
  const HomeScreenModel({this.backgroundColor, this.appBar, this.body});

  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? body;
}
