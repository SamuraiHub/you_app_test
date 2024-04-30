import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/Api/auth/model/user.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../bloc/auth/auth_state.dart';
import '../repeated_widgets.dart';
import 'login.dart';

class register_screen extends StatefulWidget {
  @override
  _register_screenState createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  late final AuthCubit _authCubit;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();
  bool _showPassword1 = false;
  bool _showPassword2 = false;

  @override
  void initState() {
    super.initState();
    _authCubit = BlocProvider.of<AuthCubit>(context);
    _authCubit.emit(AuthRegister());
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
          if (state is AuthRegistered) {
            Navigator.pushReplacementNamed(
              context,
              "/",
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
          if (state is AuthRegister) {
            return _buildRegisterForm(context);
          } else if (state is AuthError) {
            return _buildRegisterForm(context);
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    ));
  }

  Widget _buildRegisterForm(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 18),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Image.asset('assets/images/back.png', width: 7, height: 14),
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
          'Register',
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
                controller: _emailController, hintText: 'Enter Email'),
            const SizedBox(height: 5),
            InputTextFieLd(
                controller: _userNameController, hintText: 'Create Username'),
            const SizedBox(height: 5),
            InputPasswordField(
                controller: _passwordController1,
                hintText: 'Create Password',
                showPassword: _showPassword1,
                onPressed: () {
                  setState(() {
                    _showPassword1 = !_showPassword1;
                  });
                }),
            const SizedBox(height: 5),
            InputPasswordField(
                controller: _passwordController2,
                hintText: 'Confirm Password',
                showPassword: _showPassword2,
                onPressed: () {
                  setState(() {
                    _showPassword2 = !_showPassword2;
                  });
                }),
            const SizedBox(height: 20),
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
                      ),),
                    onPressed: () {
                      if (_emailController.text.isEmpty ||
                          _userNameController.text.isEmpty ||
                          _passwordController1.text.isEmpty ||
                          _passwordController2.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('All fields are required'),
                            duration: const Duration(seconds: 3)));
                        return;
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_emailController.text);

                      if (!emailValid) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'Check your Email',
                              style: const TextStyle(color: Colors.red),
                            ),
                            duration: const Duration(seconds: 3)));
                        return;
                      }

                      if (_passwordController1.text !=
                          _passwordController2.text) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'Passwords do not match',
                              style: const TextStyle(color: Colors.red),
                            ),
                            duration: const Duration(seconds: 3)));
                        return;
                      }
                      if (_passwordController1.text.length < 8) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Password must be at least 8 characters long',
                              style: const TextStyle(color: Colors.red),
                            ),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                        return;
                      }
                      User user = User(
                          email: _emailController.text,
                          username: _userNameController.text,
                          password: _passwordController1.text);
                      BlocProvider.of<AuthCubit>(context).register(user);
                    },
                    child: const Center(
                        child: Text('Register',
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
                  'Have an account?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter'),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: goldenGradientWidget(
                    Text(
                      'Login here',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Inter'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
