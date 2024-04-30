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
late IProfileRepository profileRepository;

late MockAuthRepository mockAuthRepository;
late IAuthRepository authRepository;

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

  var exception = Exception('No Internet Connection');

  group('Profile Repository', () {
    blocTest<ProfileBloc, ProfileState>('getProfile',
        build: () {
          when(mockProfileRepository.getProfile('token'))
              .thenAnswer((_) async => (Left(exception)));
          return profileBloc;
        },
        act: (bloc) => bloc.add(ProfileInitialLoad('token')),
        expect: () => [ProfileLoading(), ProfileError(exception)]);

    blocTest<ProfileBloc, ProfileState>('updateProfile',
        build: () {
          when(mockProfileRepository.updateProfile('token', profileData))
              .thenAnswer((_) async => Left(exception));
          return profileBloc;
        },
        act: (bloc) => bloc.add(ProfileUpdate('token', profileData)),
        expect: () => [ProfileLoading(), ProfileError(exception)]);

  });

  group('Auth Cubit', () {
    blocTest<AuthCubit, AuthState>('login',
        build: () {
          when(mockAuthRepository.login(user))
              .thenAnswer((_) async => Left(exception));
          return cubit;
        },
        act: (bloc) => bloc.login(user),
        expect: () => [AuthError(exception)]);
    blocTest<AuthCubit, AuthState>('register',
        build: () {
          when(mockAuthRepository.register(user))
              .thenAnswer((_) async => Left(exception));
          return cubit;
        },
        act: (bloc) => bloc.register(user),
        expect: () => [AuthError(exception)]);
  });

  tearDown(() {
    cubit.close();
    profileBloc.close();
  });
}