import 'package:testapp/http/dukkantek_http_client.dart';

import '../model/user.dart';
import '../services/api_services.dart';

class HttpService extends ApiServices {
  DukkanTekHttpClient httpClient = DukkanTekHttpClient();

  @override
  Future<User?> login(String email, String password) async {
    //as we don't hav a login service, so to simulate login we will retrieve all users and find by email and password
    List<User> users = await httpClient.getUsers();
    for (int i = 0; i < users.length; i++) {
      var user = users[i];
      if (user.email == email && user.password == password) {
        return user;
      }
    }
    return null;
  }

  @override
  Future<bool> signup(User user) async {
    return await httpClient.signup(user);
  }
}
