import 'package:flutter/material.dart';
import 'package:learn_basic/navigation/RootNavigation.dart';

void main() {
  runApp(MaterialApp.router(
    routerConfig: RootNavigation.router,
  ));
}
