import 'package:flutter/material.dart';

import '../../../apis/auth.dart';
import '../../../ui/BaseButton/BaseButton.dart';
import '../../../ui/BaseTextFiled/BaseTextField.dart';
import '../../../utils/func.dart';
import 'register.validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPassShow = true;
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
    void goBack() {
      Navigator.pop(context);
    }

    void onSubmit() async {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        toggleLoading();
        final response = await AuthApis.register(email, password);

        if (response.success == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registered successfully'),
            ),
          );
          goBack();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data['message']),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: goBack,
              child: const Icon(Icons.arrow_back, size: 30),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: Center(
                    //     child: FractionallySizedBox(
                    //       widthFactor: 0.5,
                    //       child: Image.asset('assets/images/logos/logo.png'),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 40),
                    const Text(
                      'Sign up',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 40),
                    BaseTextField(
                      hint: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      onSaved: (value) {
                        if (value != null) email = value;
                      },
                      validator: emailValidator,
                    ),
                    const SizedBox(height: 20),
                    // const BaseTextField(
                    //   hint: 'Username',
                    //   prefixIcon: Icon(Icons.person_2),
                    // ),
                    const SizedBox(height: 20),
                    BaseTextField(
                      hint: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: isPassShow,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPassShow = !isPassShow;
                          });
                        },
                        child: Icon(isPassShow
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      onSaved: (value) {
                        if (value != null) password = value;
                      },
                      validator: passwordValidator,
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      children: [
                        const Text("By signing up, you're agree to our "),
                        Text(
                          'Terms & Conditions ',
                          style: TextStyle(
                            color: hexToColor('#2368f6'),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text('and '),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: hexToColor('#2368f6'),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: BaseButton(
                          loading: loading,
                          onPressed: onSubmit,
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          )),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Have an account ?'),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: goBack,
                          child: Text(
                            'Login',
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
            )
          ],
        ),
      ),
    )));
  }
}
