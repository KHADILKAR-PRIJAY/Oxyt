import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oxyt_app/screens/Home_page.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController myController = TextEditingController();

  int? token = 123456789;
  int? mobile_number = 8980868694;

  Future loggenIn() async {
    var url =
        Uri.parse('https://www.oxyt.notioninfosoft.com/api/verify_otp.php');
    var response = await http.post(url, body: {
      'user_id': '51',
      'otp': myController.text,
      'mobile_number': mobile_number.toString(),
      'token': token.toString(),
    });
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D2454),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Oxyt',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 20),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Enter OTP',
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                loggenIn();
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 400,
                child: Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
