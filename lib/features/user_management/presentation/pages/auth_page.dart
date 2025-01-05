// lib/features/user_management/presentation/pages/auth_page.dart
import 'package:apiofa_mob/features/user_management/presentation/pages/login_page.dart';
import 'package:apiofa_mob/features/user_management/presentation/pages/register_page.dart';
import 'package:apiofa_mob/features/user_management/presentation/widgets/auth_toggle_buttons.dart';
import 'package:apiofa_mob/features/user_management/shared/auth_option.dart';
import 'package:flutter/material.dart';
import 'package:apiofa_mob/features/user_management/presentation/widgets/welcome_text.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  static const String routeName = '/auth-screen';

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {


  AuthOption _selectedOption = AuthOption.login;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'lib/features/user_management/shared/logoAPIOFA.png',
                height: 110, // You can adjust the height as needed
              ),
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(height: 100, child: WelcomeText(option: _selectedOption)),
              ),
              
              const SizedBox(height: 22),
              AuthToggleButtons(
                selectedOption: _selectedOption,
                onOptionChanged: (AuthOption option) {
                  setState(() {
                    _selectedOption = option;
                  });
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _selectedOption == AuthOption.login
                    ? const LoginPage()
                    : const RegisterPage(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}