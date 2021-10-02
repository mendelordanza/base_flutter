import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_cheatsheet/core/constants/strings.dart';
import 'package:widget_cheatsheet/features/presentation/user_controller.dart';

import '../../injection_container.dart';

class UsersPage extends StatelessWidget {
  final userController = Get.put(getIt.get<UserController>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: userController.users.length,
                  itemBuilder: (context, index) {
                    final item = userController.users.value[index];
                    return ListTile(
                      title: Text(item.name),
                    );
                  },
                );
              }),
            ),
            ElevatedButton(
              onPressed: () {
                userController.fetchUsers();
              },
              child: Text("Load users"),
            ),
          ],
        ));
  }
}
