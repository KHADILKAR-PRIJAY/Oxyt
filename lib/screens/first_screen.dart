import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'sign_in.dart';
import 'package:http/http.dart' as http;

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController myController = TextEditingController();
  int token = 123456789;
  int mobile_number = 8980868694;

  Future loggedIn() async {
    var url = Uri.parse('https://www.oxyt.notioninfosoft.com/api/login.php');
    var response = await http.post(url, body: {
      'token': token.toString(),
      'mobile_number': myController.text,
    });
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D2454),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
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
                labelText: 'Mobile number',
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                loggedIn();
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 400,
                child: Text(
                  'Get OTP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
