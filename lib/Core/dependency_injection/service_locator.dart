import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../Api/Environment.dart';
import '../Api/auth/i_auth_api_Provider.dart';
import '../Api/auth/model/auth_api_provider.dart';
import '../Api/profile/i_profile_api_provider.dart';
import '../Api/profile/profile_api_provider.dart';
import '../Network/dio_network_client.dart';
import '../Network/i_network_client.dart';
import '../mapper/profile_mapper.dart';
import '../repository/auth_repository.dart';
import '../repository/i_auth_repository.dart';
import '../repository/i_profile_repository.dart';
import '../repository/profile_repository.dart';

final sl = GetIt.instance;

Future<void> registerServiceLocator(Environment env) async {
  registerNetworkClients(env);
  registerApis();
  registerRepositories();
  registerMappers();
}

void registerNetworkClients(Environment env) {
  sl.registerLazySingleton<INetworkClient>(() {
    var client =
    DioNetworkClient(options: BaseOptions(baseUrl: env.youAppUrl));
    return client;
  }, instanceName: 'yourApp');
}

void registerApis() {
  sl.registerLazySingleton<IProfileApiProvider>(() {
    return ProfileApiProvider(sl.get(instanceName: 'yourApp'));
  });

  sl.registerLazySingleton<IAuthApiProvider>(() {
    return AuthApiProvider(sl.get(instanceName: 'yourApp'));
  });
}

void registerRepositories() {
  sl.registerLazySingleton<IProfileRepository>(() {
    return ProfileRepository(sl.get(), sl.get());
  });

  sl.registerLazySingleton<IAuthRepository>(() {
    return AuthRepository(sl.get());
  });
}

void registerMappers() {
  sl.registerLazySingleton<ProfileMapper>(() => ProfileMapper());
}