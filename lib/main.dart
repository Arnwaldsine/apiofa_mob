import 'package:apiofa_mob/common/global_variables.dart';
import 'package:apiofa_mob/features/user_management/presentation/pages/auth_page.dart';
import 'package:apiofa_mob/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APIOFA BETA V1.1.1',
      theme: ThemeData(
        // This is the theme of your application.
        // 
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        scaffoldBackgroundColor: const Color.fromARGB(255, 28, 1, 29) ,
        colorScheme: const ColorScheme.dark(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(elevation: 0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 7, 7, 7))),     

        useMaterial3: true,
      ),
      onGenerateRoute:((settings) => generateRoute(settings)) ,
      home: const AuthPage(),
    );
  }
}
