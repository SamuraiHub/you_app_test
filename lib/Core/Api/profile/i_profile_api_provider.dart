import 'model/profile.dart';

abstract class IProfileApiProvider {
  Future<Profile> getProfile(String access_token);
  Future<String> updateProfile(Profile profile, String access_token);
}