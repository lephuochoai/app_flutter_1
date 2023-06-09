import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../apis/auth.dart';
import '../../../models/auth.dart';
import '../../../ui/BaseButton/BaseButton.dart';
import '../../../ui/BaseTextFiled/BaseTextField.dart';
import '../../../utils/func.dart';
import '../../../utils/route-utils.dart';
import 'login.validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPassShow = false;
  String email = '';
  String password = '';
  bool loading = false;
  final formKey = GlobalKey<FormState>();

  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context);

    void directRegisterScreen() {
      context.push(AppPage.register.toPath);
    }

    void directForgotPasswordScreen() {
      context.push(AppPage.forgotPassword.toPath);
    }

    void onSubmitForm() async {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        toggleLoading();
        final result = await AuthApis.login(email, password);

        if (result.success == true) {
          String token = result.data['token'];
          String refreshToken = result.data['refreshToken'];
          authState.login(token: token, refreshToken: refreshToken);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login successfully'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result.data['message']),
            ),
          );
        }

        toggleLoading();
      }
    }

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child:
                                  Image.asset('assets/images/logos/logo.png'),
                            ),
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 40),
                          BaseTextField(
                            hint: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            onSaved: (value) {
                              if (value != null) email = value.trim();
                            },
                            validator: emailValidator,
                          ),
                          const SizedBox(height: 20),
                          BaseTextField(
                            obscureText: !isPassShow,
                            hint: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPassShow = !isPassShow;
                                });
                              },
                              child: Icon(
                                isPassShow
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            onSaved: (value) {
                              if (value != null) password = value;
                            },
                            validator: passwordValidator,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: directForgotPasswordScreen,
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
                              loading: loading,
                              onPressed: onSubmitForm,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
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
                              GestureDetector(
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
                ))));
  }
}
