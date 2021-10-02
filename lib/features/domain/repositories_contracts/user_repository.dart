import 'package:widget_cheatsheet/features/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}