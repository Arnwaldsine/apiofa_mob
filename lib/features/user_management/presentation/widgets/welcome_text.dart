import 'package:apiofa_mob/features/user_management/shared/auth_option.dart';
import 'package:flutter/material.dart';


class WelcomeText extends StatelessWidget {

  final AuthOption option;

  const WelcomeText({required this.option, super.key});

  @override
  Widget build(BuildContext context) {
    String displayText;
    TextStyle textStyle = const TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );

    if (option == AuthOption.login) {
      displayText = "Iniciá sesión y encontrate con el mejor contenido de la red";
    } else {
      displayText = "Registrate y apoyá a tus creadores favoritos";
    }

    return Text(
      displayText,
      style: textStyle,
      textAlign: TextAlign.left,
    );
  }
}