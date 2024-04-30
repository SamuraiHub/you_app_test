import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:you_app_test/Core/Api/auth/model/user.dart';
import 'package:you_app_test/Core/model/profile_data.dart';
import 'package:you_app_test/Core/repository/auth_repository.dart';
import 'package:you_app_test/Core/repository/i_auth_repository.dart';
import 'package:you_app_test/Core/repository/i_profile_repository.dart';
import 'package:you_app_test/Core/repository/profile_repository.dart';
import 'package:you_app_test/Presentation/bloc/auth/auth_cubit.dart';
import 'package:you_app_test/Presentation/bloc/auth/auth_state.dart';
import 'package:you_app_test/Presentation/bloc/profile/profile_bloc.dart';
import 'package:you_app_test/Presentation/bloc/profile/profile_event.dart';
import 'package:you_app_test/Presentation/bloc/profile/profile_state.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'you_app_bloc_test.mocks.dart';

late MockProfileRepository mockProfileRepository;

late MockAuthRepository mockAuthRepository;

final ProfileData profileData = ProfileData(
  name: 'John Doe',
  email: 'jone.doe@gmail.com',
  username: 'johndoe',
  interests: ['coding', 'reading', 'writing'],
  weight: 70,
  height: 180,
  birthday: "01 01 1990",
);

final User user = User(
  email: 'jone.doe@gmail.com',
  username: 'johndoe',
  password: 'password',
);
late AuthCubit cubit;
late ProfileBloc profileBloc;

@GenerateMocks([IProfileRepository] , customMocks: [MockSpec<IProfileRepository>(as: #MockProfileRepository)]) // Add this line
@GenerateMocks([IAuthRepository] , customMocks: [MockSpec<IAuthRepository>(as: #MockAuthRepository)]) // Add this line
void main() {
  setUp(() {
    mockProfileRepository = MockProfileRepository();
    mockAuthRepository = MockAuthRepository();

    cubit = AuthCubit(mockAuthRepository);
    profileBloc = ProfileBloc(mockProfileRepository);
  });

  group('Profile Repository', () {
    blocTest<ProfileBloc, ProfileState>('getProfile',
        build: () {
          when(mockProfileRepository.getProfile('token'))
              .thenAnswer((_) async => Right(profileData));
          return profileBloc;
        },
        act: (bloc) => bloc.add(ProfileInitialLoad('token')),
        expect: () => [ProfileLoading(), ProfileLoaded(profileData)]);

    blocTest<ProfileBloc, ProfileState>('updateProfile',
        build: () {
          when(mockProfileRepository.updateProfile('token', profileData))
              .thenAnswer((_) async => Right('Profile Updated'));
          return profileBloc;
        },
        act: (bloc) => bloc.add(ProfileUpdate('token', profileData)),
        expect: () => [ProfileLoading(), ProfileLoaded(profileData)]);

  });

  group('Auth Cubit', () {
    blocTest<AuthCubit, AuthState>('login',
        build: () {
          when(mockAuthRepository.login(user))
              .thenAnswer((_) async => Right({'access_token': 'token'}));
          return cubit;
        },
        act: (bloc) => bloc.login(user),
        expect: () => [AuthLoggedIn('token')]);
    blocTest<AuthCubit, AuthState>('register',
        build: () {
          when(mockAuthRepository.register(user))
              .thenAnswer((_) async => Right('Registered'));
          return cubit;
        },
        act: (bloc) => bloc.register(user),
        expect: () => [AuthRegistered()]);
  });

  tearDown(() {
    cubit.close();
    profileBloc.close();
  });
}