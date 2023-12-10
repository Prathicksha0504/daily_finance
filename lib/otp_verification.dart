import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OTPVerificationScreen(),
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
    );
  }
}

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController _otpController = TextEditingController();

  // Function to check if the entered OTP is valid (4 digits)
  bool isOtpValid(String otp) {
    return otp.length == 4 && int.tryParse(otp) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 4, // Set maximum length to 4 digits
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.blue),
              decoration: InputDecoration(
                counterText: '', // Hide the character counter
                hintText: 'Enter OTP',
                hintStyle: TextStyle(color: Colors.blue.withOpacity(0.7)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String enteredOTP = _otpController.text;
                if (isOtpValid(enteredOTP)) {
                  print('Entered OTP: $enteredOTP');
                  // Add your verification logic here
                } else {
                  print('Invalid OTP. Please enter a 4-digit OTP.');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
