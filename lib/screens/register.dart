import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 35.0, left: 40.0, right: 40.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
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
                  labelText: 'Mobile No.',
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
                  labelText: 'Create Password',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Repeat Password',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  Checkbox(
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
                      fontSize: 10.0,
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
    );
  }
}
