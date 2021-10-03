import 'package:get_it/get_it.dart';
import 'package:widget_cheatsheet/features/presentation/user_controller.dart';

import 'core/network/graphql/graphql_client.dart';
import 'core/network/http_client.dart';
import 'features/data/datasources/user_datasource.dart';
import 'features/data/repositories_impl/user_repository_impl.dart';
import 'features/domain/repositories_contracts/user_repository.dart';
import 'features/domain/usecases/get_user.dart';
import 'features/domain/usecases/get_users.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Controller
  getIt.registerFactory(() => UserController(
        uGetUsers: getIt(),
        uGetUser: getIt(),
      ));

  // Use cases
  getIt.registerLazySingleton(() => GetUsers(getIt()));
  getIt.registerLazySingleton(() => GetUser(getIt()));

  // Repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<UserDataSource>(
    () => UserDataSourceImpl(httpClient: getIt()),
  );

  getIt.registerLazySingleton(() => GraphqlClient());
  getIt.registerLazySingleton(() => BaseHttpClient());
}
