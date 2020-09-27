import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  String password;
  String email;
  String name;
  final Color kColor = Colors.amber;
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Let\'s Get Started'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 35.0, left: 40.0, right: 40.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email ID',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (input) {
                    return input.contains('@') ? null : 'Enter valid email';
                  },
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Create Password',
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
                  onChanged: (value) {
                    password = value;
                  },
                  // ignore: missing_return
                  validator: (input) {
                    passwordValidator(input);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Repeat Password',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  obscureText: !showPassword,
                  // ignore: missing_return
                  validator: (input) {
                    repeatPasswordValidator(input);
                  },
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: checkBoxValue,
                      onChanged: (bool ifChecked) {
                        setState(() {
                          checkBoxValue = ifChecked;
                        });
                      },
                    ),
                    Text(
                      'By ticking this box, you agree to Terms & Conditions',
                      style: TextStyle(
                        fontSize: 10.5,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40.0,
                  width: 200.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: kColor,
                    elevation: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Agree & Create Account',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  String passwordValidator(String input) {
    if (input.isEmpty) {
      return 'Enter a password';
    } else {
      //Checks for 8 characters
      //Checks for at least one number / alphabet
      RegExp regex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
      if (!regex.hasMatch(input)) {
        if (input.length < 8) {
          return 'The password should be at least 8 characters';
        } else {
          return 'The password should have at least one number or alphabet';
        }
      }
    }
    return null;
  }

  String repeatPasswordValidator(String input) {
    if (input.isEmpty) {
      return 'Repeat password';
    } else {
      //Checks for 8 characters
      //Checks for at least one number / alphabet
      RegExp regex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
      if (!regex.hasMatch(input)) {
        if (input.length < 8) {
          return 'The password should be at least 8 characters';
        } else if (input != password) {
          return 'Password Mismatch';
        }
      }
    }
    return null;
  }
}
