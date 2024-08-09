import 'package:farmafacil_colaborador/components/button.dart';
import 'package:farmafacil_colaborador/components/input.dart';
import 'package:farmafacil_colaborador/controllers/login_controller.dart';
import 'package:farmafacil_colaborador/screens/signup_screen.dart';
import 'package:farmafacil_colaborador/theme/application_colors.dart';
import 'package:farmafacil_colaborador/utils/navigate.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  final loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        child: Builder(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    "assets/logo.png",
                    scale: 0.8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Olá!",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 36,
                            color: ApplicationColors.primary,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Comece preenchendo os campos abaixo:",
                            style: TextStyle(
                              fontSize: 14,
                              color: ApplicationColors.secondaryText,
                            ),
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Input(
                              controller: emailController,
                              placeholder: "E-mail",
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) {
                                return loginController.validateEmail(email);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Input(
                                controller: passwordController,
                                validator: (senha) {
                                  return loginController.validatePassword(senha);
                                },
                                placeholder: "Senha",
                                hideText: loginController.hidePassword,
                                icon: loginController.passwordIcon,
                                onIconTap: () {
                                  setState(() {
                                    loginController.togglePasswordVisibility();
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15, bottom: 15),
                              child: Button(
                                height: 44,
                                onPress: () {
                                  loginController.login(
                                    _formKey,
                                    context,
                                    emailController.text,
                                    passwordController.text,
                                  );
                                },
                                text: "Entre",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Não tem uma conta? ",
                                style: TextStyle(
                                  color: ApplicationColors.primaryText,
                                ),
                              ),
                              TextSpan(
                                text: "Crie.",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigate.to(context, const SignupScreen());
                                  },
                                style: const TextStyle(
                                  color: ApplicationColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}