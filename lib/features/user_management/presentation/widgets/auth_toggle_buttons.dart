// lib/features/user_management/presentation/widgets/auth_toggle_buttons.dart
import 'package:apiofa_mob/features/user_management/shared/auth_option.dart';
import 'package:flutter/material.dart';

class AuthToggleButtons extends StatefulWidget {
  final AuthOption selectedOption;
  final ValueChanged<AuthOption> onOptionChanged;

  const AuthToggleButtons({
    required this.selectedOption,
    required this.onOptionChanged,
    super.key,
  });

  @override
  _AuthToggleButtonsState createState() => _AuthToggleButtonsState();
}

class _AuthToggleButtonsState extends State<AuthToggleButtons> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(100),
      isSelected: AuthOption.values
          .map((option) => option == widget.selectedOption)
          .toList(),
      onPressed: (int index) {
        widget.onOptionChanged(AuthOption.values[index]);
      },
      constraints: const BoxConstraints(
        minHeight: 35.0,
        minWidth: 150.0,
        
      ),
      children: AuthOption.values
          .map((option) => Text(option == AuthOption.login ? 'Login' : 'Register'))
          .toList(),
    );
  }
}