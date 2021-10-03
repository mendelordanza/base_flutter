import 'package:widget_cheatsheet/core/usecases/usecase.dart';
import 'package:widget_cheatsheet/features/domain/entities/user.dart';
import 'package:widget_cheatsheet/features/domain/repositories_contracts/user_repository.dart';

class GetUser extends UseCase<User, GetUserParams> {
  final UserRepository repository;

  GetUser(this.repository);

  @override
  Future<User> call(GetUserParams params) async {
    return await repository.getUser(params.id);
  }
}

class GetUserParams {
  final int id;

  GetUserParams({required this.id});
}