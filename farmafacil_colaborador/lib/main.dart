import 'package:farmafacil_colaborador/theme/application_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FarmaFacilColab());
}

class FarmaFacilColab extends StatelessWidget {
  const FarmaFacilColab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmaFacil - Colaboradores',
      theme: ApplicationThemes.defaultTheme,
      home: const Scaffold(
        body: Center(
          child: Text("Hello world."),
        ),
      ),
    );
  }
}
