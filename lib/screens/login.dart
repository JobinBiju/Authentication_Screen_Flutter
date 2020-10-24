import 'dart:html';

import 'package:authenticatio_instock/screens/register.dart';
import 'package:authenticatio_instock/utilities/global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();
  double phone; String password; String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email ID',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter the email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
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
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: !showPassword,
                      validator: (input) {
                        passwordValidator(input);
                        return null;
                      },
                      onSaved: (input) => password = input,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: () {},
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
                      height: 50.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 200.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.amber,
                        elevation: 0,
                        child: GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              if (await checkConnection()) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('Logging In! taking a while'),
                                ));
                              }
                           }
                          },
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
      ),
    );
  }

  String passwordValidator(String input) {
    if (input.isEmpty) {
      return 'Enter a password to continue';
    } else {
      //Checks for 8 characters
      //Checks for at least one number / alphabet
      RegExp regex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
      if (!regex.hasMatch(input)) {
        if (input.length < 8) {
          return 'Password should be at least 8 characters';
        } else {
          return 'Password should have at least one number or alphabet';
        }
      }
    }
    return null;
  }

}


