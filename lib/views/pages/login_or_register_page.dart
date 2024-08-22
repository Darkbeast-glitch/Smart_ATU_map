

import 'package:flutter/material.dart';
import 'package:smart_atu_nav/views/Auths/login_page.dart';
import 'package:smart_atu_nav/views/Auths/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  _LoginOrRegisterPageState createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3332631056.
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  } 

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap:() => togglePages(),);
    }else{
      return RegisterPage(onTap: () => togglePages(),);
    }
  }
    
  }