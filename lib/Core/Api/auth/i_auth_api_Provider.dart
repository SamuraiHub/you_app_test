
import 'model/user.dart';

abstract class IAuthApiProvider {
  Future<String> register(User user);
  Future<Map<String, dynamic>> login(User user);
}