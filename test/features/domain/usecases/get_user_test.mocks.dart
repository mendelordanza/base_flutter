// Mocks generated by Mockito 5.0.16 from annotations
// in widget_cheatsheet/test/features/domain/usecases/get_user_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:widget_cheatsheet/features/domain/entities/user.dart' as _i2;
import 'package:widget_cheatsheet/features/domain/repositories_contracts/user_repository.dart'
    as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUser_0 extends _i1.Fake implements _i2.User {}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i3.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.User>> getUsers() =>
      (super.noSuchMethod(Invocation.method(#getUsers, []),
              returnValue: Future<List<_i2.User>>.value(<_i2.User>[]))
          as _i4.Future<List<_i2.User>>);
  @override
  _i4.Future<_i2.User> getUser(int? id) =>
      (super.noSuchMethod(Invocation.method(#getUser, [id]),
              returnValue: Future<_i2.User>.value(_FakeUser_0()))
          as _i4.Future<_i2.User>);
  @override
  String toString() => super.toString();
}
