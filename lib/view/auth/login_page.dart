import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/globel_variable.dart';
import '../home/screen/test.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({required Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obsc = true;

  Future<void> _login() async {
    try {
      // Check if username and password match the desired values
      if (_usernameController.text.trim() == "ADMIN" && _passwordController.text.trim() == "ADMIN") {
        // If matched, navigate to MyHomePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        // If not matched, show an error message
        // You can customize the error message or handle it in any way you prefer
        print("Invalid username or password");
        // Show an error message to the user
      }
    } catch (e) {
      // Handle other errors here
      print("Error: $e");
      // You can show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/log.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: Center(
                      child: Container(
                        width: w * 0.3,
                        height: h * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: h * 0.044),
                            Text(
                              'UserName',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: h * 0.012),
                            Container(
                              height: h * 0.067,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: ' username',
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.018),
                            Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: h * 0.012),
                            Container(
                              height: h * 0.067,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: obsc,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: ' password',
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        obsc = !obsc;
                                      });
                                    },
                                    child: obsc
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.018),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.018),
                            GestureDetector(
                              onTap: _login,
                              child: Container(
                                height: h * 0.067,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade900,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Log In',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.018),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
