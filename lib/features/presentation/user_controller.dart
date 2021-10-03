import 'package:get/get.dart';
import 'package:widget_cheatsheet/features/domain/entities/user.dart';
import 'package:widget_cheatsheet/features/domain/usecases/get_user.dart';
import 'package:widget_cheatsheet/features/domain/usecases/get_users.dart';

class UserController extends GetxController {
  final GetUsers uGetUsers;
  final GetUser uGetUser;

  UserController({
    required this.uGetUsers,
    required this.uGetUser,
  });

  RxList<User> users = List<User>.empty(growable: true).obs;
  Rxn<User> user = Rxn<User>();

  fetchUsers() async {
    final result = await uGetUsers(GetUsersParams());
    users(result);
  }

  fetchUser(int id) async {
    print(id);
    final result = await uGetUser(
      GetUserParams(id: id),
    );
    user(result);
  }
}
