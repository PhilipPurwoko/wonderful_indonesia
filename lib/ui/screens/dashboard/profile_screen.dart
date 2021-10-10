import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wonderful_indonesia/provider/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    return Center(
      child: Text(authProvider.user.name),
    );
  }
}
