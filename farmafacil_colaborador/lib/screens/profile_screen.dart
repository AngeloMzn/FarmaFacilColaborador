import 'package:farmafacil_colaborador/database/authentication.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text("sair"),
          onPressed: () {
            Authentication.logout(context);
          },
        ),
      ),
    );
  }
}
