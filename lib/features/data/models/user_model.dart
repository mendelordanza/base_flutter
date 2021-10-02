import 'package:widget_cheatsheet/features/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(id: json["id"], name: json["name"]);

  static List<UserModel> fromJsonArray(dynamic object) {
    List<UserModel> userModels = [];
    if (object != null) {
      (object as List).forEach((user) {
        userModels.add(UserModel.fromJson(user));
      });
    }
    return userModels;
  }
}
