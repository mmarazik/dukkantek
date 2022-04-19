import 'package:google_sign_in/google_sign_in.dart';

import '../services/service_locator.dart';
import '../model/user.dart';

class ApplicationService {
  User? _user;
  GoogleSignInAccount? _account;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      'email',
    ],
  );

  User? get user => _user;
  bool isLoggedIn() {
    return _user != null;
  }

  String? getUserEmail() {
    return _user != null
        ? _user!.email
        : (_account != null ? _account!.email : null);
  }

  String? getUserFullName() {
    return _user != null
        ? (_user!.firstName + " " + _user!.lastName)
        : (_account != null ? _account!.displayName : null);
  }

  Future<bool> login(String email, password) async {
    _user = await ServiceLocator.getApiService().login(email, password);
    return isLoggedIn();
  }

  Future<bool> googleLogin() async {
    try {
      _account = await _googleSignIn.signIn();
      return _account != null;
    } catch (error) {
      print(error);
      return false;
    }
  }

  void logout() async {
    _user = null;
    if (_account != null) {
      _googleSignIn.disconnect();
      _account = null;
    }
  }
}
