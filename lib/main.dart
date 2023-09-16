import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mytodolist/pages/home/home_page.dart';
import 'package:mytodolist/pages/home/menu_page.dart';
import 'package:mytodolist/pages/welcome_page/welcome_page.dart';
import 'package:mytodolist/routes/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Todo List App',
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}

