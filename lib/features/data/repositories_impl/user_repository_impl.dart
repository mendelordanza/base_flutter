import 'package:widget_cheatsheet/features/data/datasources/user_datasource.dart';
import 'package:widget_cheatsheet/features/domain/entities/user.dart';
import 'package:widget_cheatsheet/features/domain/repositories_contracts/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<User>> getUsers() async {
    final users = await remoteDataSource.getUsers();
    return users;
  }
}