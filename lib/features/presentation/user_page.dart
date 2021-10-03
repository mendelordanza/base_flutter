import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_cheatsheet/core/constants/strings.dart';
import 'package:widget_cheatsheet/features/presentation/user_controller.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final userController = Get.find<UserController>();
  final id = Get.arguments as int;

  @override
  void initState() {
    userController.fetchUser(id);
    super.initState();
  }

  @override
  void dispose() {
    userController.user.value = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Obx(() {
        if (userController.user.value != null) {
          return Center(
            child: Text(userController.user.value!.name),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
