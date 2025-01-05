import 'package:apiofa_mob/common/services/user_management/auth_service.dart';
import 'package:apiofa_mob/core/network/api_client.dart';
import 'package:apiofa_mob/features/user_management/data/models/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService(
    secureStorage: const FlutterSecureStorage(),
    apiClient: ApiClient.instance,
  );  
  String _selectedRole = 'Fan';


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    // methods
    String? validateEmail(String? value) {
      
      
      if (value == Null ||  value == ''){
        return 'Ingrese un mail';
      }

      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      return value!.isEmpty || !regex.hasMatch(value)
          ? 'Ingresa un email valido'
          : null ;
    }

     Future<void> _performLogin() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logging in...')),
    );
    try {
      await _authService.loginUser(
        Login(email: _emailController.text, password: _passwordController.text, role: _selectedRole)
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
      );
    }
  }

    // return
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => validateEmail(value)
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese una contraseña';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: DropdownButtonFormField<String>(
                value: _selectedRole,
                decoration: const InputDecoration(
                  labelText: 'Rol',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Fan',
                    child: Text('Fan'),
                  ),
                  DropdownMenuItem(
                    value: 'Creator',
                    child: Text('Creador'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a role';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_loginFormKey.currentState!.validate()) {
                  // Perform login logic here
                  _performLogin();
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

