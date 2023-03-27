import 'package:c/app/screens/login/components/forgotpassword.dart';
import 'package:c/app/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ConfirmEmail extends StatelessWidget {
  static String id = 'confirm-email';
  final String message;

  const ConfirmEmail({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Icon(
                  Icons.mail,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Check your mail',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              message,
              style: const TextStyle(
                  color: Color.fromARGB(255, 17, 153, 221), fontSize: 16),
            ),
            SizedBox(
              width: 270,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 23, 93, 121)),
                ),
                child: const Text(
                  'Open your email',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Get.to(const SignInScreen());
                },
                child: const Text("Skip, I'll confirm later")),
            const SizedBox(
              height: 170,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      const Text(
                          "Did not recover the email? Check your spam filter, or ",
                          style: TextStyle(fontSize: 10)),
                      TextButton(
                          onPressed: () {
                            Get.to(const ForgotPassword());
                          },
                          child: const Text("try another email address",
                              style: TextStyle(fontSize: 10))),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
