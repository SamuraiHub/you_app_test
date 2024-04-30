import 'package:dartz/dartz.dart';

import '../Api/auth/i_auth_api_Provider.dart';
import '../Api/auth/model/user.dart';
import 'i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  late IAuthApiProvider _authApi;

  AuthRepository(this._authApi);

  @override
  Future<Either<Exception, Map<String, dynamic>>> login(User user) async {
    try {
      var result = await _authApi.login(user);
      return Right(result);
    } on Exception catch (exception) {
      throw Left(exception);
    }
  }

  @override
  Future<Either<Exception, String>> register(User user) async {
    try {
      var result = await _authApi.register(user);
      return Right(result);
    } on Exception catch (exception) {
      throw Left(exception);
    }
  }
}
