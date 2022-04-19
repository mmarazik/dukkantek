import 'package:flutter/material.dart';
import 'package:testapp/services/service_locator.dart';

import '../model/user.dart';
import '../routes/routes.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "/home";
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  User? _user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _user = ServiceLocator.getApplicationService().user;
  }

  void _doLogout() {
    ServiceLocator.getApplicationService().logout();
    Navigator.of(context).pushReplacementNamed(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    String? fullName = ServiceLocator.getApplicationService().getUserFullName();
    String? email = ServiceLocator.getApplicationService().getUserEmail();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          DropdownButton(
              underline: Container(),
              icon: Icon(Icons.more_vert,
                  color: Theme.of(context).primaryIconTheme.color),
              items: [
                DropdownMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app,
                          color: Theme.of(context).primaryColor),
                      const SizedBox(width: 8),
                      Text("Logout",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                    ],
                  ),
                  value: 'logout',
                ),
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == "logout") {
                  _doLogout();
                }
              }),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome $fullName <$email>",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
        ),
      ),
    );
  }
}
