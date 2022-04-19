import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:testapp/routes/routes.dart';
import 'package:testapp/services/service_locator.dart';
import 'package:testapp/ui/utils.dart';

import '../widgets/login_form.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "/login";

  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  void _doGoogleLogin() async {
    bool success = await ServiceLocator.getApplicationService().googleLogin();
    if (!success) {
      showAlertDialog(context, "SignIn failed", null, null, false);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Container(
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.all(25),
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
                            const LoginForm(),
                            SignInButton(
                              Buttons.Google,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                // _showButtonPressDialog(context, 'Google');
                                _doGoogleLogin();
                              },
                            ),
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
