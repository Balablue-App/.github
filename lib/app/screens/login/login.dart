import 'package:c/app/screens/settings/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../constants/custom_colors.dart';
import '../../routes/bottom_navigator.dart';
import '../../services/authentication.dart';
import '../../widgets/clientauthentication.dart';
import '../../widgets/google_sign_in_button.dart';
import '../../utils/validator.dart';
import '../home/home.dart';
import '../signin/signin.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "/sign in";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  late bool _passwordVisible;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _authClient = AuthenticationClient();
  bool _isProgress = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.balablue,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Form(
                key: _formKey,
                child:
                    // ignore: prefer_const_literals_to_create_immutables
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      const SizedBox(height: 30),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Signin.routeName);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 25,
                                    color: Color.fromARGB(
                                      255,
                                      244,
                                      244,
                                      244,
                                    )),
                              ),
                            ),
                          )),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 25,
                                color: Color.fromARGB(
                                  255,
                                  244,
                                  244,
                                  244,
                                )),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "With the Balablueapp, you can create your virtual organization where meetings can be held from time to time. You can create a hangout platform for your group of 5 besties. You can also hold conferences with over 400 people in attendance, whilst enjoying amazing features.",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: Color.fromARGB(255, 244, 244, 244)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 40.0,
                                          right: 14,
                                          left: 14,
                                          bottom: 8),
                                      child: TextFormField(
                                        controller: _emailController,
                                        style: const TextStyle(
                                            height: 2,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                          ),
                                          hintText: "Email",
                                          hintStyle: TextStyle(fontSize: 15),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 15.0, 20.0, 10.0),
                                        ),
                                        cursorColor: Colors.black,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0,
                                      right: 14,
                                      left: 14,
                                      bottom: 8),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    focusNode: _passwordFocusNode,
                                    validator: Validator.password,
                                    obscureText: !_passwordVisible,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50.0)),
                                      ),

                                      labelText: 'Password',
                                      hintText: 'Enter your password',
                                      // Here is key idea
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed("/fifth");
                                  },
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Forgot password?",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              211, 134, 131, 131)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                _isProgress
                                    ? const CircularProgressIndicator()
                                    : SizedBox(
                                        width: 250,
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      CustomColors.balablue),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ))),
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                _isProgress = true;
                                              });
                                              final User? user =
                                                  await _authClient.loginUser(
                                                context: context,
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text,
                                              );
                                              setState(() {
                                                _isProgress = false;
                                              });

                                              if (user != null) {
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BottomNavigator(
                                                              user: user)),
                                                  (route) => false,
                                                );
                                              }
                                            }
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.0,
                                                right: 14,
                                                left: 14,
                                                bottom: 8),
                                            child: Text(
                                              'Sign In',
                                              style: TextStyle(
                                                  fontSize: 22.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FutureBuilder(
                                  future: Authentication.initializeFirebase(
                                      context: context),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return const Text(
                                          'Error initializing Firebase');
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return const GoogleSignInButton();
                                    }
                                    return CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        CustomColors.balablue,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
