import 'package:flutter/material.dart';
import 'package:testapp/error/api_exception.dart';
import 'package:testapp/error/http_exception.dart';

import '../ui/utils.dart';

class SingupForm extends StatefulWidget {
  final Future<bool> Function(
          String firstName, String lastName, String email, String password)
      _doSignup;

  const SingupForm(
      Future<bool> Function(
              String firstName, String lastName, String email, String password)
          handleSignup,
      {Key? key})
      : _doSignup = handleSignup,
        super(key: key);

  @override
  State<SingupForm> createState() => _SingupFormState();
}

class _SingupFormState extends State<SingupForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _confirmPassword;
  String? _firstName;
  String? _lastName;
  String? _errorMessage;

  void _onSubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    try {
      bool success =
          await widget._doSignup(_firstName!, _lastName!, _email!, _password!);
      if (success) {
        showAlertDialog(
            context, "User sign up successfully", "Success", null, true);
      } else {
        showAlertDialog(
            context,
            "Failed to sign user up, please try again later",
            null,
            null,
            false);
      }
    } on ApiException catch (e) {
      showAlertDialog(context, e.message, null, null, false);
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
              key: const ValueKey("firstName"),
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              enableSuggestions: false,
              keyboardType: TextInputType.text,
              // inputFormatters: [
              //   new FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.secondaryContainer,
                filled: true,
                labelText: "First Name",
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                value = value?.trim();
                if (value == null || value.isEmpty) {
                  return "Pleasea enter your First Name";
                }
                return null;
              },
              onSaved: (newValue) {
                _firstName = newValue;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              key: const ValueKey("lastName"),
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              enableSuggestions: false,
              keyboardType: TextInputType.text,
              // inputFormatters: [
              //   new FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.secondaryContainer,
                filled: true,
                labelText: "Last Name",
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                value = value?.trim();
                if (value == null || value.isEmpty) {
                  return "Pleasea enter your Last Name";
                }
                return null;
              },
              onSaved: (newValue) {
                _lastName = newValue;
              },
            ),
            const SizedBox(
              height: 10,
            ),
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
                } else if (!value.isValidEmail()) {
                  return "Plesae enter a valid email address";
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
                } else if (value.length < kPasswordMinLength) {
                  return "Please enter a minium of ${kPasswordMinLength.toString()} characters";
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
            TextFormField(
              key: const ValueKey("confirmPassword"),
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.secondaryContainer,
                filled: true,
                labelText: "Confirm Password",
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                value = value?.trim();
                if (value == null || value.isEmpty) {
                  return "Please confirm your password";
                } else if (value != _password) {
                  return "Password and confirm password do not match";
                }
                return null;
              },
              onSaved: (newValue) {
                _confirmPassword = newValue;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text("Submit"),
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
