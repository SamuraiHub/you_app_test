import 'package:dartz/dartz.dart';
import '../Api/auth/model/user.dart';

abstract class IAuthRepository {
  Future<Either<Exception, String>> register(User user);
  Future<Either<Exception, Map<String, dynamic>>> login(User user);
}