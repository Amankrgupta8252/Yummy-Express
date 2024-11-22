import 'package:flutter/material.dart';
import 'package:yemmy_food/api/api.dart';
import 'package:yemmy_food/api/validator.dart';
import 'package:yemmy_food/screens/Forgot_Password.dart';
import 'package:yemmy_food/screens/manu_page.dart';
import 'package:yemmy_food/screens/manu_page_after_login.dart';
import 'package:yemmy_food/screens/registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ValidatorController validatorController = ValidatorController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  String? emailError;
  String? passwordError;
  bool _isPasswordVisible = false;

  void _signIn() async {
    setState(() {
      emailError = validatorController.validateEmail(txtEmail.text);
      passwordError = validatorController.validatePassword(txtPassword.text);
    });

    if (emailError == null && passwordError == null) {
      final response = await ApiService.login(
        email: txtEmail.text,
        password: txtPassword.text,
      );
      if (response['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successfully!'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ManuPageAfterLogin(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response['message']),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
        title: const Text(
          'Login Page',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 15, 15, 15),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
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
              'Login Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 81, 43, 43),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle:
                    const TextStyle(color: Color.fromARGB(166, 167, 166, 166)),
                filled: true,
                fillColor: const Color.fromARGB(255, 115, 227, 229),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                errorText: emailError,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: txtPassword,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle:
                    const TextStyle(color: Color.fromARGB(166, 167, 166, 166)),
                filled: true,
                fillColor: const Color.fromARGB(255, 115, 227, 229),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                errorText: passwordError,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()),
                    );
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(color: Color.fromARGB(255, 252, 251, 253)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Registration()),
                    );
                  },
                  child: const Text(
                    'Register Now',
                    style: TextStyle(color: Color.fromARGB(255, 247, 248, 249)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signIn,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 100),
                backgroundColor: const Color.fromARGB(255, 115, 227, 229),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Login This App. And Enjoy Your Food',
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 236, 236),
                )),
          ],
        ),
      ),
    );
  }
}
