import 'package:flutter/material.dart';
import 'package:testapp/error/api_exception.dart';

import '../services/service_locator.dart';
import '../error/http_exception.dart';
import '../model/user.dart';
import '../routes/routes.dart';
import '../ui/utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void _onSubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    try {
      bool success = await ServiceLocator.getApplicationService()
          .login(_email!, _password!);
      if (!success) {
        showAlertDialog(
            context, "Invalid username or password", null, null, false);
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.home);
      }
    } on ApiException catch (e) {
      showAlertDialog(context, e.message, null, null, false);
    } catch (error) {
      showAlertDialog(context, error.toString(), null, null, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              key: const ValueKey("email"),
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
              // inputFormatters: [
              //   new FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.secondaryContainer,
                filled: true,
                labelText: "Email",
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                value = value?.trim();
                if (value == null || value.isEmpty) {
                  return "Pleasea enter your email address";
                }
                return null;
              },
              onSaved: (newValue) {
                _email = newValue;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              key: const ValueKey("password"),
              validator: (value) {
                _password = value;
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Theme.of(context).colorScheme.secondaryContainer,
                  filled: true,
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary)),
              onSaved: (newValue) {
                _password = newValue;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text("Signup"),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.signup);
                  },
                ),
                ElevatedButton(
                  child: const Text("Login"),
                  onPressed: _onSubmit,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
