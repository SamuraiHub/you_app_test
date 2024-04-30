
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_app_test/Core/repository/i_auth_repository.dart';
import 'package:you_app_test/Core/repository/i_profile_repository.dart';
import 'package:you_app_test/Presentation/bloc/auth/auth_cubit.dart';
import 'package:you_app_test/Presentation/widget/auth/register.dart';
import 'package:you_app_test/Presentation/widget/profile/profile_page.dart';

import '../Presentation/bloc/profile/profile_bloc.dart';
import '../Presentation/widget/auth/login.dart';
import '../Presentation/widget/profile/interests.dart';
import 'dependency_injection/service_locator.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => AuthCubit(
                sl.get<IAuthRepository>(),
              ),
            )
          ], child: login_screen()),
        );

      case '/register':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) =>
                    AuthCubit(sl.get<IAuthRepository>())),
          ], child: register_screen()),
        );

      case '/profile':
        String token = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => ProfileBloc(
                sl.get<IProfileRepository>(),
              ),
            )
          ], child: profile_screen(token)),
        );

      case '/interests':
        List<String> interests_list = routeSettings.arguments as List<String>;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) =>
                    ProfileBloc(sl.get<IProfileRepository>())),
          ], child: interests(interests_list: interests_list)),
        );

      default:
        return MaterialPageRoute<Scaffold>(builder: (context) {
          return Scaffold(
            body: Center(
                child: Text('No route defined for ${routeSettings.name}')),
          );
        });
    }
  }
}