import 'package:c/app/screens/login/login.dart';
import 'package:c/app/screens/signin/signin.dart';
import 'package:c/app/screens/welcome/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../screens/login/components/forgotpassword.dart';
import '../screens/splash/splash.dart';
import '../services/authentication.dart';

var appRoutes = [
  GetPage(
    name: Splash.routeName,
    page: () => Splash(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: Welcome.routeName,
    page: () => const Welcome(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: SignInScreen.routeName,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: Signin.routeName,
    page: () => const Signin(),
  ),
  GetPage(
    name: '/fifth',
    page: () => const ForgotPassword(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];
