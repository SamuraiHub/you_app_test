import 'package:dartz/dartz.dart';

import 'package:you_app_test/Core/model/profile_data.dart';

import '../Api/profile/i_profile_api_provider.dart';
import '../mapper/profile_mapper.dart';
import 'i_profile_repository.dart';

class ProfileRepository implements IProfileRepository {
  late IProfileApiProvider _profileApi;
  late ProfileMapper _mapper;

  ProfileRepository(this._profileApi, this._mapper);

  @override
  Future<Either<Exception, ProfileData>> getProfile(String access_token) async {
    try {
      var result = await _profileApi.getProfile(access_token);
      var mappedResult = _mapper.to(result);
      return Right(mappedResult);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<Exception, String>> updateProfile(String access_token, ProfileData profileData) async {
    try {
      var result = await _profileApi.updateProfile(_mapper.from(profileData), access_token);
      return Right(result);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}