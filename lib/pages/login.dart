import 'package:flutter/material.dart';
import 'package:jklu_eezy/components/signup_login/auth_field.dart';
import 'package:jklu_eezy/components/signup_login/auth_gradient.dart';
import 'package:jklu_eezy/pages/home.dart';
import 'package:jklu_eezy/pages/signup.dart';
import 'package:jklu_eezy/components/signup_login/app_pallete.dart';

// Admin credentials for demo
const _adminEmail = 'admin@jklu.edu.in';
const _adminPassword = 'Admin@123';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Pre-fill admin credentials for demo
  late final TextEditingController emailController =
      TextEditingController(text: _adminEmail);
  late final TextEditingController passwordController =
      TextEditingController(text: _adminPassword);
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? errorMessage;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (!formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    // Simulate a short delay then navigate
    Future.delayed(const Duration(milliseconds: 800), () {
      if (!mounted) return;

      final email = emailController.text.trim();
      final password = passwordController.text;

      if (email == _adminEmail && password == _adminPassword) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Invalid credentials. Use the pre-filled admin credentials.';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.info_outline, color: Colors.blue, size: 16),
                    SizedBox(width: 6),
                    Text(
                      'Admin credentials are pre-filled for demo',
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AuthField(
                hintText: 'Email',
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              AuthField(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              GestureDetector(
                onTap: isLoading ? null : login,
                child: AuthGradientButton(
                  buttonText: isLoading ? 'Signing In...' : 'Sign In',
                  onPressed: isLoading ? () {} : login,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignUpPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
