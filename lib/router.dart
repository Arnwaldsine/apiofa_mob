import 'package:apiofa_mob/features/user_management/presentation/pages/auth_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthPage.routeName:

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthPage(),);
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("ERROR 404: LA PAGINA NO EXISTE."),
          ),
        )
      );
  }
}