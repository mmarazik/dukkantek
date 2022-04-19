import '../model/user.dart';

abstract class ApiServices {
  Future<User?> login(String email, String password);
  Future<bool> signup(User user);
}
