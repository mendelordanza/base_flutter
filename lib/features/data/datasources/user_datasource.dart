import 'dart:convert';

import 'package:widget_cheatsheet/core/network/http_client.dart';
import 'package:widget_cheatsheet/features/data/models/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUser(int id);
}

class UserDataSourceImpl extends UserDataSource {
  final BaseHttpClient httpClient;

  UserDataSourceImpl({required this.httpClient});

  @override
  Future<List<UserModel>> getUsers() async {
    final json = await httpClient.get(api: "/users");
    return UserModel.fromJsonArray(jsonDecode(json.body));
  }

  @override
  Future<UserModel> getUser(int id) async {
    final json = await httpClient.get(api: "/users", query: {"id": id.toString()});
    print(json.body);
    return UserModel.fromJson(jsonDecode(json.body)[0]);
  }
}