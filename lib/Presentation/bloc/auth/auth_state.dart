import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthLogin extends AuthState {}

class AuthLoggedIn extends AuthState {
  final String token;

  AuthLoggedIn(this.token);

  @override
  List<Object?> get props => [token];
}

class AuthRegister extends AuthState {}

class AuthRegistered extends AuthState {}

class AuthError extends AuthState {
  final Exception exception;

  AuthError(this.exception);

  @override
  List<Object?> get props => [exception];
}

