import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasteq_bloc/domain/authentication_model/authentication.dart';
import 'package:tasteq_bloc/presentation/base_screen.dart';
import 'package:tasteq_bloc/presentation/screens/Authentication/signup.dart';
import '../../../core/widgets/snackbar.dart';
import '../../../core/widgets/textfield.dart';
import '../../../infrastructure/authentication_function/authentication.dart';
import '../../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Hive.openBox<Authentication>('authentication');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
        child: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                  ),
                ],
              ),
              height: 500,
              width: 250,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'SIGNIN',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    callTextField(
                        labelname: 'Username',
                        inputcontroller: _emailController,
                        max: 1),
                    callTextField(
                        labelname: 'Password',
                        inputcontroller: _passwordController,
                        max: 1),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty) {
                            if (_emailController.text == 'loginwithpassword' &&
                                _passwordController.text ==
                                    'loginwithpassword') {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => BaseScreen()));
                            }
                            login(_emailController.text.trim(),
                                _passwordController.text.trim(), context);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => BaseScreen(),
                                ),
                                (route) => false);
                            // saveLogin();
                          } else {
                            callSnackBar(msg: 'Fill all fields', ctx: context);
                          }
                        },
                        child: const Text('SIGNIN'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Do not have an account?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const SignUp()));
                        },
                        child: const Text('SIGNUP'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SAVE_KEY_NAME, true);
  }
}
