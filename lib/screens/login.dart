import 'package:authenticatio_instock/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 110.0, bottom: 50.0),
              child: Text(
                'instock',
                style: TextStyle(
                  fontSize: 55.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 40.0, right: 40.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone No.',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                        suffixIcon: IconButton(
                          iconSize: 20.0,
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(showPassword
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash),
                        ),
                    ),
                    obscureText: !showPassword,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 40.0,
                    width: 200.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.amber,
                      elevation: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 40.0,
                    width: 200.0,
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (contest) => RegisterScreen()),);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.amber,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          'New to instock? Sign Up',
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
