import 'package:flutter/material.dart';

import '../../../ui/BaseButton/BaseButton.dart';
import '../../../ui/BaseTextFiled/BaseTextField.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = '';

  @override
  Widget build(BuildContext context) {
    void goBack() {
      Navigator.pop(context);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.asset('assets/images/logos/logo.png'),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const SizedBox(
                          width: 200,
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                            "Don't worry! It happens. Please enter the address associated with your account"),
                        const SizedBox(height: 40),
                        const BaseTextField(
                          hint: 'Username',
                          prefixIcon: Icon(Icons.person_2),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: BaseButton(
                              onPressed: () {},
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 0,
                  child: InkWell(
                    onTap: goBack,
                    child: const Icon(Icons.arrow_back, size: 30),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
