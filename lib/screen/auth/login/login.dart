import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/BaseButton/BaseButton.dart';
import 'package:flutter_application_1/ui/BaseTextFiled/BaseTextField.dart';
import 'package:flutter_application_1/utils/func.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/route-utils.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPassShow = true;

  @override
  Widget build(BuildContext context) {
    void directRegisterScreen() {
      context.push(AppPage.register.toPath);
    }

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Image.asset('assets/images/logos/logo.png'),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              const BaseTextField(
                hint: 'Username',
                prefixIcon: Icon(Icons.person_2),
              ),
              const SizedBox(height: 20),
              BaseTextField(
                hint: 'Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPassShow = !isPassShow;
                    });
                  },
                  child: Icon(
                      isPassShow ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot Password',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: hexToColor('#2368f6'),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: BaseButton(
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    )),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: Row(children: [
                  Expanded(
                    child: Container(
                      color: hexToColor('#ECEDF1'),
                      height: 1,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: hexToColor('#727D90'),
                        fontSize: 18),
                  ),
                  Expanded(
                    child: Container(
                      color: hexToColor('#ECEDF1'),
                      height: 1,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 25),
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: BaseButton(
                      type: 'secondary',
                      onPressed: () {},
                      child: const Text('Login with Google'),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 30,
                    bottom: 10,
                    child: Image.asset(
                      'assets/images/google.png',
                      width: 25,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Create a new account ?'),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: directRegisterScreen,
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: hexToColor('#2368f6')),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    )));
  }
}
