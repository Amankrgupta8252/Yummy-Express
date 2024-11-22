import 'package:flutter/material.dart';
import 'package:yemmy_food/api/api.dart';
import 'package:yemmy_food/api/validator.dart';
import 'package:yemmy_food/screens/login_page.dart';
import 'package:yemmy_food/screens/manu_page_after_login.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final ValidatorController validatorController = ValidatorController();
  final TextEditingController txtUserName = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtMobile = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final TextEditingController txtCity = TextEditingController();

  String? usernameError;
  String? emailError;
  String? mobileError;
  String? passwordError;
  String? cityError;

  bool isPasswordVisible = false;

  Future<void> _signUp() async {
    setState(() {
      usernameError = validatorController.validateUsername(txtUserName.text);
      emailError = validatorController.validateEmail(txtEmail.text);
      mobileError = validatorController.validateMobile(txtMobile.text);
      passwordError = validatorController.validatePassword(txtPassword.text);
      cityError = validatorController.validateCity(txtCity.text);
    });

    if (usernameError == null &&
        emailError == null &&
        mobileError == null &&
        passwordError == null &&
        cityError == null) {
      final response = await ApiService.signup(
        username: txtUserName.text,
        email: txtEmail.text,
        password: txtPassword.text,
      );

      if (response['status'] == 'success') {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signup successfully!')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ManuPageAfterLogin()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response['message'] ?? 'Signup failed'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 244, 212),
        title: const Text('Registration Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 4, 244, 212),
                Color.fromARGB(255, 1, 58, 51),
              ],
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/Group_1.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Register Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 81, 43, 43),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: txtUserName,
                labelText: 'Name',
                errorText: usernameError,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: txtEmail,
                labelText: 'Email',
                errorText: emailError,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: txtMobile,
                labelText: 'Mobile',
                errorText: mobileError,
                keyboardType: TextInputType.phone, // Numeric keyboard
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: txtPassword,
                labelText: 'Password',
                obscureText: !isPasswordVisible,
                errorText: passwordError,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: txtCity,
                labelText: 'City',
                errorText: cityError,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 100,
                  ),
                  backgroundColor: const Color.fromARGB(255, 115, 227, 229),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? errorText,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text, // Default keyboard type
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType, // Set keyboard type
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: const Color.fromARGB(255, 115, 227, 229),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        errorText: errorText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
