import 'package:flutter/material.dart';
import 'package:mobile_login_app/components/custom_text_field.dart';

import '../services/api_service.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = "";
  bool showPassword = true;

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _isLoading = false;
        _errorMessage = "Username and Password cannot be empty.";
      });
      return;
    }
    final response = await ApiService.login(username, password);
    setState(() {
      _isLoading = false;
    });
    if (response['Status_Code'] == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen(response)),
      );
    } else {
      setState(() {
        _errorMessage = "Login failed. Please check your credentials.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.amber[400]),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.login_outlined,
                size: 80,
                color: Colors.blue[600],
              ),
              const Text(
                "Login to Continue",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                controller: _usernameController,
                labelText: "username",
                obsecureText: false,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                  controller: _passwordController,
                  labelText: "password",
                  obsecureText: showPassword,
                  prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: showPassword
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off))),
              const SizedBox(
                height: 30,
              ),
              _errorMessage.isNotEmpty
                  ? Text(_errorMessage,
                      style: const TextStyle(color: Colors.red))
                  : const SizedBox.shrink(),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[600],
                          fixedSize: const Size(200, 50)),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
