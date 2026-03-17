import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: TextButton(
        onPressed: onPressed,

        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.all(15),
        ),

        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
