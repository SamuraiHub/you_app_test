import 'package:dartz/dartz.dart';

import '../model/profile_data.dart';

abstract class IProfileRepository {
  Future<Either<Exception, ProfileData>> getProfile(String access_token);
  Future<Either<Exception, String>> updateProfile(
      String access_token, ProfileData profileData);
}