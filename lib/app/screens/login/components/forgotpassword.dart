// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/custom_colors.dart';
import '../../../widgets/clippingclass..dart';
import 'local widgets/confirmemail.dart';

class ForgotPassword extends StatefulWidget {
  static String id = 'forgot-password';
  final String message =
      "An email has just been sent to you, Click the link provided to complete password reset. Also check your spam emails";

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  late String _email;

  get key => null;

  _passwordReset() async {
    try {
      _formKey.currentState?.save();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return ConfirmEmail(
            message: widget.message,
            key: key,
          );
        }),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.firebaseWhite,
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_left_sharp,
            color: Colors.blue,
          ),
          label: const Text(
            'Back',
            style: TextStyle(color: Colors.blue),
          ),
          style: ElevatedButton.styleFrom(
              elevation: 0, primary: Colors.transparent),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 251, 251),
      body: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.loose,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Card(
                        color: const Color.fromARGB(255, 136, 194, 242),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: const Icon(
                          Icons.key,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Forgotten Password?',
                        style: TextStyle(fontSize: 30, color: Colors.blue),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Enter the email associated with your account and we’ll send an email with instructions to reset your password.',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Email Adress ',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                    ),
                    TextFormField(
                      onSaved: (newEmail) {
                        _email = newEmail!;
                      },
                      style: const TextStyle(
                          color: Color.fromARGB(255, 28, 138, 228)),
                      decoration: const InputDecoration(
                        labelText: 'example@gmail.com',
                        // ignore: unnecessary_const
                        icon: const Icon(
                          Icons.mail,
                          color: Color.fromARGB(255, 27, 119, 225),
                        ),
                        errorStyle: TextStyle(color: Colors.blue),
                        labelStyle: TextStyle(color: Colors.blue),
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 270,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 23, 93, 121)),
                        ),
                        child: const Text(
                          'Send Instructions',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _passwordReset();
                          if (kDebugMode) {
                            print(_email);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
