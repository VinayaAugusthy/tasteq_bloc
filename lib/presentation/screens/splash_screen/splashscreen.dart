// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasteq_bloc/main.dart';
import 'package:tasteq_bloc/presentation/screens/home/home_screen.dart';
import '../Authentication/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo3.png'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future gotoLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  Future<void> checkUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final userLogged = prefs.getBool(SAVE_KEY_NAME);

    if (userLogged == false || userLogged == null) {
      gotoLogin();
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const HomeScreen(),
      ));
    }
  }
}
