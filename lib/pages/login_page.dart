import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final _userEditController = TextEditingController();
  final _passwordEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 64.0),
              SizedBox(height: 160.0, child: Image.asset('assets/logo.png')),
              SizedBox(height: 64.0),
              TextFormField(
                controller: _userEditController,
                decoration: InputDecoration(
                  labelText: 'User Name',
                ),
              ),
              SizedBox(height: 12.0),
              TextFormField(
                controller: _passwordEditController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 120.0, child: Image.asset('assets/thumb.png')),
            ],
          ),
        ),
      ),
    );
  }
}
