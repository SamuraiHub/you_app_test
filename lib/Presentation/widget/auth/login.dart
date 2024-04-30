import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/Api/auth/model/user.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../bloc/auth/auth_state.dart';
import '../profile/profile_page.dart';
import '../repeated_widgets.dart';

class login_screen extends StatefulWidget {
  @override
  _login_screenState createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  late final AuthCubit _authCubit;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  Widget back = Image.asset('assets/images/back.png', width: 7, height: 14);

  @override
  void initState() {
    super.initState();
    _authCubit = BlocProvider.of<AuthCubit>(context);
    _authCubit.emit(AuthLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xFF1F4247),
            Color(0xFF0D1D23),
            Color(0xFF0D1D23),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedIn) {
            Navigator.pushReplacementNamed(
              context,
              "/profile",
              arguments: state.token,
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.exception.toString(),
                style: const TextStyle(color: Colors.red),
              ),
              duration: const Duration(seconds: 3),
            ));
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          if (state is AuthLogin) {
            return _buildLoginForm(context);
          } else if (state is AuthError) {
            return _buildLoginForm(context);
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    ));
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 17,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: 18),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  back,
                  const SizedBox(width: 10),
                  Text(
                    'Back',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 41),
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter'),
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputTextFieLd(
                    controller: _emailController,
                    hintText: 'Enter Username/Email'),
                const SizedBox(height: 5),
                InputPasswordField(
                    controller: _passwordController,
                    hintText: 'Enter Password',
                    showPassword: _showPassword,
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    }),
                const SizedBox(height: 5),
                Container(
                    width: 331.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF62CDCB), Color(0xFF4599DB)],
                      ),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(_emailController.text);
                          _authCubit.login(
                            User(
                              email: emailValid ? _emailController.text : "",
                              username: emailValid ? "" : _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        },
                        child: const Center(
                            child: Text('Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Inter'))))),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No account?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter'),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: goldenGradientWidget(
                        Text(
                          'Register here',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Inter'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]);
  }
}
