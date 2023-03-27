import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../constants/custom_colors.dart';
import '../../widgets/clippingclass..dart';
import '../login/login.dart';
import '../signin/signin.dart';

class Welcome extends StatefulWidget {
  static const routeName = "/Welcome";
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(clipBehavior: Clip.none, fit: StackFit.loose, children: <
          Widget>[
        ClipPath(
          clipper: ClippingClass(),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 10 / 16,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 237, 242, 242),
                  Color.fromARGB(255, 235, 240, 240)
                ],
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: ListView(children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/logo2.png"),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text(
                              "Balablue app",
                              style: TextStyle(
                                color: Color.fromARGB(255, 43, 172, 226),
                                fontSize: 30,
                              ),
                            )),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: const Text(
                            "A virtual town hall",
                            style: TextStyle(
                              color: Color.fromARGB(255, 43, 172, 226),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                          width: 1000,
                          height: 330,
                          child: Card(
                            color: CustomColors.balablue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: <Widget>[
                              const Padding(padding: EdgeInsets.only(top: 50)),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    "Welcome",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 35,
                                        color: Color.fromARGB(
                                          255,
                                          244,
                                          244,
                                          244,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    "Balablue is an online conference call app that enables you to connect with colleagues, partners, and friends from anywhere in the world.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 11,
                                        color: Color.fromARGB(
                                          255,
                                          244,
                                          244,
                                          244,
                                        )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 35.0, bottom: 5.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                          width: 100,
                                          height: 55,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              )),
                                              elevation:
                                                  MaterialStateProperty.all(10),
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      Color.fromARGB(
                                                          255, 6, 10, 14)),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Signin(),
                                                ),
                                                (route) => false,
                                              );
                                            },
                                            child: const Text('Sign up',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 236, 240, 242))),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 120),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          width: 100,
                                          height: 55,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              )),
                                              elevation:
                                                  MaterialStateProperty.all(10),
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color.fromARGB(
                                                          255, 42, 185, 241)),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignInScreen(),
                                                ),
                                                (route) => false,
                                              );
                                            },
                                            child: const Text('Sign in',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          )),
                    ]))
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
