import 'package:bloc/bloc.dart';
import '../../../Core/Api/auth/model/user.dart';
import '../../../Core/repository/i_auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late IAuthRepository authRepo;

  AuthCubit(this.authRepo) : super(AuthLogin());

  void login(User user) async {
      var output = await authRepo.login(user);
      output.fold((exception) => emit(AuthError(exception)), (data) {
        if(data['access_token'] != null)
          emit(AuthLoggedIn(data['access_token']!));
        else
          emit(AuthError(Exception(data['message'])));
      });
  }

  void register(User user) async {
      var output = await authRepo.register(user);
      output.fold((exception) => emit(AuthError(exception)), (data) {
        emit(AuthRegistered());
      });
  }
}