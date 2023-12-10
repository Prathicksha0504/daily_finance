import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

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
            PinInputTextField(
              pinLength: 4,
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: UnderlineDecoration(
                colorBuilder: PinListenColorBuilder(Colors.blue, Colors.blue),
              ),
              autoFocus: true,
              textInputAction: TextInputAction.done,
              onSubmit: (pin) {
                print('Entered OTP: $pin');
                // Add your verification logic here
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String enteredOTP = _otpController.text;
                if (enteredOTP.length == 4) {
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
