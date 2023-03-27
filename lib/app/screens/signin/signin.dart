// ignore_for_file: use_build_context_synchronously

import 'package:c/app/screens/settings/settings.dart';
import 'package:c/app/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../constants/custom_colors.dart';
import '../../routes/bottom_navigator.dart';
import '../../widgets/clientauthentication.dart';
import '../../widgets/clippingclass..dart';

import '../home/home.dart';
import 'components/validator.dart';

class Signin extends StatefulWidget {
  static const routeName = "/Register";
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmpasswordController = TextEditingController();

  final _nameFocusNode = FocusNode();

  final _usernameFocusNode = FocusNode();

  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  final _confirmpasswordFocusNode = FocusNode();

  final _authClient = AuthenticationClient();

  bool _isProgress = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _usernameFocusNode.unfocus();
        _emailFocusNode.unfocus();
        _passwordFocusNode.unfocus();
        _confirmpasswordFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.balablue,
        appBar: AppBar(
          backgroundColor: CustomColors.balablue,
          leadingWidth: 100,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_left_sharp,
              ),
              onPressed: () => Get.to(() => Welcome())),
        ),
        body: Stack(clipBehavior: Clip.none, fit: StackFit.loose, children: <
            Widget>[
          ClipPath(
            clipper: ClippingClass(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 8 / 20,
              decoration: const BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage("assets/Icons/onboarding.jpg"),
                //     opacity: 60,
                //     fit: BoxFit.cover),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 43, 172, 226),
                    Color.fromARGB(255, 43, 172, 226),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 200),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 1000,
              height: 600,
              child: Card(
                color: CustomColors.firebaseWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 20, 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 230, 20),
                              child: Text('Register',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blue))),
                          TextFormField(
                            controller: _nameController,
                            focusNode: _nameFocusNode,
                            validator: Validator.name,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              hintText: 'Enter your name',
                              label: Text('FullName'),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _usernameController,
                            focusNode: _usernameFocusNode,
                            validator: Validator.name,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              hintText: 'Enter your name',
                              label: Text('Username'),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                            validator: Validator.email,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              hintText: 'Enter your email',
                              label: Text('Email'),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            validator: Validator.password,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              hintText: 'Enter your password',
                              label: Text('password'),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                              controller: _confirmpasswordController,
                              focusNode: _confirmpasswordFocusNode,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                hintText: 'Enter your password',
                                label: Text('confirm password'),
                              ),
                              validator: (val) {
                                if (val == null) return 'Empty';
                                if (val != _passwordController.text) {
                                  return 'Not Match';
                                }
                                return null;
                              }),
                          const SizedBox(height: 24),
                          _isProgress
                              ? const CircularProgressIndicator()
                              : SizedBox(
                                  width: double.maxFinite,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _isProgress = true;
                                        });
                                        final User? user =
                                            await _authClient.registerUser(
                                          name: _nameController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        );
                                        setState(() {
                                          _isProgress = false;
                                        });

                                        if (user != null) {
                                          Get.to(() =>
                                              BottomNavigator(user: user));
                                        }
                                      }
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          CustomColors.balablue,
                                        ),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text(
                                        'Create an account',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
