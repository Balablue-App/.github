import 'dart:async';

import 'package:c/app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:c/app/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../home/home.dart';
import 'localwidget/waveshape.dart';

class Splash extends StatefulWidget {
  static const routeName = "/splash";
  Splash({
    Key? key,
  }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  static User? firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Welcome())));

    return Scaffold(
      body: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.loose,
          children: <Widget>[
            ClipPath(
              clipper: WaveShape(),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 4 / 16,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 4, 109, 114),
                      Color.fromARGB(255, 5, 101, 106)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 80,
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  // backgroundImage: NetworkImage(''),
                ),
              ),
            ),
            Stack(children: [
              Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/logo2.png"),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: const Text(
                            "Balablue app",
                            style: TextStyle(
                              color: Color.fromARGB(255, 1, 94, 110),
                              fontSize: 30,
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "Version:1.0.0",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ))
            ])
          ]),
    );
  }
}
