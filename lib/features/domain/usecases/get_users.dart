import 'package:widget_cheatsheet/core/usecases/usecase.dart';
import 'package:widget_cheatsheet/features/domain/entities/user.dart';
import 'package:widget_cheatsheet/features/domain/repositories_contracts/user_repository.dart';

class GetUsers extends UseCase<List<User>, GetUsersParams> {
  final UserRepository repository;

  GetUsers(this.repository);

  @override
  Future<List<User>> call(GetUsersParams params) {
    return repository.getUsers();
  }
}

class GetUsersParams {
}