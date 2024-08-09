import 'package:farmafacil_colaborador/screens/home_screen.dart';
import 'package:farmafacil_colaborador/theme/application_theme.dart';
import 'package:farmafacil_colaborador/utils/login_cookie.dart';
import 'package:flutter/material.dart';
import 'package:farmafacil_colaborador/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool? loggedIn = await LoginCookie.getLoginState();
  runApp(FarmaFacilColaborador(loggedIn: loggedIn ?? false));
}

class FarmaFacilColaborador extends StatelessWidget {
  final bool loggedIn;
  const FarmaFacilColaborador({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmaFacil - Colaborador',
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("pt"),
      ],
      theme: ApplicationThemes.defaultTheme,
      home: Scaffold(
        body: loggedIn? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
