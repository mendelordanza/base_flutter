import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:widget_cheatsheet/features/domain/entities/user.dart';
import 'package:widget_cheatsheet/features/domain/repositories_contracts/user_repository.dart';
import 'package:widget_cheatsheet/features/domain/usecases/get_user.dart';
import 'package:mockito/annotations.dart';

import 'get_user_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late GetUser usecase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = GetUser(mockUserRepository);
  });

  final tId = 1;
  final tUser = User(id: tId, name: 'John Doe');

  test(
    'should get user from repository',
    () async {
      //arrange
      when(mockUserRepository.getUser(tId)).thenAnswer((_) async => tUser);
      //act
      final result = await usecase.call(GetUserParams(id: tId));
      //assert
      expect(result, tUser);
      verify(mockUserRepository.getUser(tId));
    },
  );
}
