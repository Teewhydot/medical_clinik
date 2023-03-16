// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

class WidgetSwitcher extends StatefulWidget {
  final Widget widget1;
  final Widget widget2;

  const WidgetSwitcher(
      {super.key, required this.widget1, required this.widget2});

  @override
  _WidgetSwitcherState createState() => _WidgetSwitcherState();
}

class _WidgetSwitcherState extends State<WidgetSwitcher> {
  late Widget currentWidget;

  @override
  void initState() {
    super.initState();
    currentWidget = widget.widget1;

    Timer(const Duration(seconds: 5), () {
      setState(() {
        currentWidget = widget.widget2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return currentWidget;
  }
}
