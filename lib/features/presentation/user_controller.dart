import 'package:get/get.dart';
import 'package:widget_cheatsheet/features/domain/entities/user.dart';
import 'package:widget_cheatsheet/features/domain/usecases/get_users.dart';

class UserController extends GetxController {
  final GetUsers uGetUsers;

  UserController({
    required this.uGetUsers,
  });

  RxList<User> users = List<User>.empty(growable: true).obs;

  fetchUsers() async {
    final result = await uGetUsers(GetUsersParams());
    users(result);
  }
}
