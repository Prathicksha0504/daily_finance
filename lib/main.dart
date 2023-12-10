import 'package:daily_finance/otp_verification.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhoneNumberInputScreen(),
    );
  }
}

class PhoneNumberInputScreen extends StatefulWidget {
  @override
  _PhoneNumberInputScreenState createState() =>
      _PhoneNumberInputScreenState();
}

class _PhoneNumberInputScreenState extends State<PhoneNumberInputScreen> {
  TextEditingController _phoneNumberController = TextEditingController();

  // Function to check if the entered phone number is valid (10 digits)
  bool isPhoneNumberValid(String phoneNumber) {
    return phoneNumber.length == 10 && int.tryParse(phoneNumber) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Phone Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              maxLength: 10, // Set maximum length to 10 digits
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String phoneNumber = _phoneNumberController.text;
                if (isPhoneNumberValid(phoneNumber)) {
                  print('Entered Phone Number: $phoneNumber');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OTPVerificationScreen()),
                  );
                } else {
                  print('Invalid Phone Number. Please enter a 10-digit number.');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
