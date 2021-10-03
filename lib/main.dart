import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/route_strings.dart';
import 'features/presentation/users_page.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();

  runApp(BaseFlutterApp());
}

class BaseFlutterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Base Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: RouteStrings.users, page: () => UsersPage()),
      ],
    );
  }
}
