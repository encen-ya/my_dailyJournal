import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {

  final void Function(String value) onChanged;
  const PasswordField({super.key, this.onChanged = _emptyFunction});

  static void _emptyFunction(String value) {}

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  void _toogleVisibilityIconButton() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscure,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text('Password'),
        suffixIcon:IconButton(
          icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
          onPressed: () => {
            _toogleVisibilityIconButton()
          }
        )  
      ),
      onChanged: widget.onChanged,
    );
  }
}