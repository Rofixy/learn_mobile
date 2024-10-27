import 'package:flutter/material.dart';
import 'home.dart'; // Import halaman Home (Pastikan ada widget HomePage)
import 'login.dart'; // Import halaman Login (Pastikan ada widget LoginPage)

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _namalengkapController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _konfirmasipasswordController =
      TextEditingController();

  // Function to display a confirmation dialog and navigate to the home page
  void _registerAndNavigateToHome() {
    String nama = _namalengkapController.text;
    String email = _emailController.text;
    String pass = _passwordController.text;
    String konpass = _konfirmasipasswordController.text;

    if (pass == konpass &&
        nama.isNotEmpty &&
        email.isNotEmpty &&
        pass.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Registration Successful"),
            content: const Text("Account has been created successfully!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Registration Error"),
            content: Text(
                "Please ensure all fields are filled and passwords match."),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Exit',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Track the things to make life easy',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              // Sign up with Google button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Google sign-up
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                icon: const Icon(Icons.g_mobiledata, color: Colors.red),
                label: const Text(
                  'Sign up with Google',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 12),
              // Sign up with Facebook button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Facebook sign-up
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                icon: const Icon(Icons.facebook, color: Colors.blue),
                label: const Text(
                  'Sign up with Facebook',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[400])),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or Sign up with Email"),
                  ),
                  Expanded(child: Divider(color: Colors.grey[400])),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _namalengkapController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _konfirmasipasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Re-enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerAndNavigateToHome,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color(0xFF0A00E6),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      'Log in here',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
