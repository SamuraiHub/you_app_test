import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mocktail/mocktail.dart';
import 'package:you_app_test/Core/Api/Environment.dart';
import 'package:you_app_test/Core/Api/auth/model/user.dart';
import 'package:you_app_test/Core/app_routes.dart';
import 'package:you_app_test/Core/dependency_injection/service_locator.dart';
import 'package:you_app_test/Core/model/profile_data.dart';
import 'package:you_app_test/Presentation/bloc/auth/auth_cubit.dart';
import 'package:you_app_test/Presentation/bloc/profile/profile_bloc.dart';
import 'package:you_app_test/Presentation/bloc/profile/profile_event.dart';
import 'package:you_app_test/Presentation/bloc/profile/profile_state.dart';
import 'package:you_app_test/Presentation/widget/auth/login.dart';
import 'package:you_app_test/Presentation/widget/profile/profile_page.dart';

import 'package:you_app_test/main.dart';

import 'you_app_bloc_test.mocks.dart';
import 'you_app_widget_test.mocks.dart';

late MockProfileRepository mockProfileRepository;

late MockAuthRepository mockAuthRepository;

@GenerateMocks([ProfileBloc], customMocks: [MockSpec<ProfileBloc>(as: #profileBloc)])
@GenerateMocks([AuthCubit], customMocks: [MockSpec<AuthCubit>(as: #cubit)])
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

class MockProfileBloc
    extends MockBloc<ProfileEvent, ProfileState>
    implements ProfileBloc {}

Widget createWidgetUnderTest() {
  return MaterialApp(
    title: 'Flutter Tests',
    onGenerateRoute: AppRoutes.generateRoute,
    initialRoute: '/',
  );
}

class ProfileStateFake extends Fake implements ProfileState {}

class ProfileEventFake extends Fake implements ProfileEvent {}

void main() {
  setUpAll(() {
    registerServiceLocator(DevEnvironment());
    registerFallbackValue<ProfileState>(ProfileStateFake());
    registerFallbackValue<ProfileEvent>(ProfileEventFake());
  });

  testWidgets(
    "Login widget test",
    (widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());
      expect(find.text('Login'), findsAtLeastNWidgets(2));
    },
  );
  testWidgets(
    "Back button is displayed",
    (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.image(const AssetImage('assets/images/back.png')),
          findsOneWidget);
    },
  );

  testWidgets(
    "Reguster here is displayed",
    (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('Register here'), findsOneWidget);
    },
  );

  testWidgets(
    "Login here is not displayed in login screen",
    (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('Login here'), findsNothing);
    },
  );

  testWidgets(
    "Login here is displayed in register screen",
    (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Register here'));
      await tester.pumpAndSettle();
      expect(find.text('Login here'), findsOneWidget);
    },
  );

  testWidgets(
    "Verify Login abd find edit buttons",
    (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final emailField = find.ancestor(
        of: find.text('Enter Username/Email'),
        matching: find.byType(TextField),
      );

      final passwordField = find.ancestor(
        of: find.text('Enter Password'),
        matching: find.byType(TextField),
      );

      await tester.enterText(emailField, "MezzoAl1");
      expect(find.text('MezzoAl1'), findsOneWidget);

      await tester.enterText(passwordField, "Mmammaj1#");
      expect(find.text('Mmammaj1#'), findsOneWidget);

      //await tester.tap(find.byType(ElevatedButton));

      final mockprofileBloc = MockProfileBloc();

      when(() => mockprofileBloc.state).thenReturn(ProfileLoaded(profileData));

      await tester.pumpWidget(
        BlocProvider<ProfileBloc>(
          create: (context) => mockprofileBloc,
          child: MaterialApp(
            title: 'Widget Test',
            home: profile_screen('token'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.image(const AssetImage('assets/images/edit-2.png')), findsNWidgets(2));
    },
  );
}
