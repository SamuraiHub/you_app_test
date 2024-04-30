import 'package:dio/dio.dart';

import '../../Network/i_network_client.dart';
import '../i_api_provider.dart';
import 'i_profile_api_provider.dart';
import 'model/profile.dart';

class ProfileApiProvider extends IApiProvider implements IProfileApiProvider {
  ProfileApiProvider(INetworkClient client) : super(client);

  @override
  Future<Profile> getProfile(String access_token) async {
    try {
      var path = 'getProfile';
      var res = await client.get(path, headers: {"x-access-token": access_token});
      return Profile.fromJson(res.data['data']);
    } on DioException catch (exception) {
      throw exception;
    }
  }

@override
  Future<String> updateProfile(Profile profile, String access_token) async {
    try {
      var path = 'updateProfile';
      var res = await client.put(path, headers: {"x-access-token": access_token}, body: profile.toJson());
      return res.data['message'];
    } on DioException catch (exception) {
      throw exception;
    }
  }
}