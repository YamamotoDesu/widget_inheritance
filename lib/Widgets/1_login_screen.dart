import 'package:flutter/material.dart';

import 'base_screen.dart';

// 1. Re-useable Widgets
class LoginScreen extends BaseScreen {
  const LoginScreen({super.key}) : super(title: 'Login');
  @override
  LoginState createState() => LoginState();
}

class LoginState extends BaseScreenState<LoginScreen> {
  @override
  Widget buildScreenBody() {
    return Container(width: 10, height: 10, color: Colors.red);
  }
}
