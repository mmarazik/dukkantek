import 'package:flutter/material.dart';
import 'package:testapp/services/http_service.dart';
import 'package:testapp/services/service_locator.dart';

import '../model/user.dart';
import '../widgets/signup_form.dart';

class SignupView extends StatefulWidget {
  static const String routeName = "/signup";

  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  Future<bool> _handleSignup(
      String firstName, String lastName, String email, String password) async {
    User user = User(
        id: 0,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
    return await ServiceLocator.getApiService().signup(user);
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Singup"),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Container(
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(
                      height: statusBarHeight,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                    image:
                                        AssetImage("assets/images/logo.webp"),
                                    width: 50),
                                Image(
                                    image:
                                        AssetImage("assets/images/name.webp"),
                                    width: 200),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SingupForm(_handleSignup),
                          ],
                        ),
                      ),
                    ),
                    // LowerMenuBar(_showBranchesScreen, _showHomeScreen)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
