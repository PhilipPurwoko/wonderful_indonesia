import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wonderful_indonesia/models/user/user_model.dart';
import 'package:wonderful_indonesia/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _authFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _authFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('WELCOME'),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    if (value.length < 4) {
                      return 'Minimum 4 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Consumer<AuthProvider>(builder: (
                  BuildContext context,
                  AuthProvider authProvider,
                  _,
                ) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final bool isFormValid =
                            _authFormKey.currentState!.validate();

                        if (isFormValid) {
                          authProvider.authenticate(
                            UserModel(name: _usernameController.text),
                          );
                        }
                      },
                      child: const Text('Login'),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
