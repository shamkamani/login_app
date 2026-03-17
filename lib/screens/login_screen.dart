import 'package:flutter/material.dart';
import 'package:login_app/widgets/custom_textfield.dart';
import 'package:login_app/widgets/login_button.dart';
import 'package:login_app/utils/validators.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 4,
        title: const Center(
          child: Text(
            "Login Screen",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff6dd5ed), Color(0xff2193b0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(25),

                  child: Form(
                    key: _formKey,

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.lock_outline,
                          size: 70,
                          color: Colors.blue,
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 25),

                        CustomTextField(
                          controller: emailController,
                          label: "Email",
                          validator: Validators.validateEmail,
                          obscureText: false,
                        ),

                        const SizedBox(height: 20),

                        CustomTextField(
                          controller: passwordController,
                          label: "Password",
                          validator: Validators.validatePassword,
                          obscureText: true,
                        ),

                        const SizedBox(height: 25),

                        LoginButton(text: "Login", onPressed: login),

                        const SizedBox(height: 15),

                        const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
