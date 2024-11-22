import 'package:flutter/material.dart';
import 'package:yemmy_food/screens/reset_password.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController _otpController = TextEditingController();

  void _validateOTP() {
    String enteredOTP = _otpController.text;

    if (enteredOTP.length == 6) {
      print('OTP Valid: $enteredOTP');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('OTP Validated: $enteredOTP'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Invalid OTP! Please enter a 6-digit OTP.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 244, 212),
        title: const Text('Enter OTP'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/Group_1.png'),
              ),
              const Text(
                'Please enter the OTP sent to your phone',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 129, 242, 227),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  labelText: 'Enter OTP',
                  hintText: '123456',
                ),
                style: const TextStyle(color: Colors.black),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResetPassword()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 239, 205),
                ),
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
