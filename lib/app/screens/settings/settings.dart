// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:keepsettings/keepsettings.dart';
import '../../constants/custom_colors.dart';
import '../../services/authentication.dart';
import 'components/Billing and subscription.dart';
import 'components/profilepage.dart';
import '../login/login.dart';
import 'components/security.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late User user;
  bool _isSigningOut = false;

 
  @override
  void initState() {
    user = widget._user;

    super.initState();
  }

  static User? firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: SizedBox(
              height: 800,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      user.photoURL != null
                          ? ClipOval(
                              child: Material(
                                color:
                                    CustomColors.firebaseWhite.withOpacity(0.3),
                                child: Image.network(
                                  user.photoURL!,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            )
                          : ClipOval(
                              child: Material(
                                color: const Color.fromARGB(255, 105, 102, 102)
                                    .withOpacity(0.3),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.person,
                                    size: 20,
                                    color: CustomColors.balablue,
                                  ),
                                ),
                              ),
                            ),
                      Column(
                        children: [
                          Text(
                            ' ${user.displayName}',
                            style: TextStyle(
                              color: CustomColors.firebaseYellow,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '${user.email!} ',
                            style: TextStyle(
                              color: CustomColors.balablue,
                              fontSize: 18,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 600,
                    child: SettingsList(sections: [
                      TilesSection(
                        title: 'Tiles',
                        tiles: [
                          SettingsTile(
                            onPressed: (_) {
                              Get.to(
                                () => Profilepage(user: user),
                              );
                            },
                            title: 'Account',
                            subtitle: 'Home',
                            leading: const Icon(CupertinoIcons.person),
                          ),
                          SettingsTile(
                            onPressed: (_) {
                              Get.to(() => const Security());
                            },
                            title: 'Security Settings',
                            leading: const Icon(CupertinoIcons.settings),
                          ),
                          SettingsTile(
                            onPressed: (_) {
                              Get.to(() => Billings());
                            },
                            title: 'Billing and subscription',
                            leading: const Icon(CupertinoIcons.creditcard),
                          ),
                          SettingsTile(
                            onPressed: (_) {
                              Navigator.of(context).maybePop();
                            },
                            title: 'Metting History',
                            leading: const Icon(CupertinoIcons.clock),
                          ),
                          SettingsTile(
                            onPressed: (_) {
                              Navigator.of(context).maybePop();
                            },
                            title: 'Contact information',
                            leading: const Icon(CupertinoIcons.person_2),
                          ),
                          SettingsTile(
                            onPressed: (_) {
                              Navigator.of(context).maybePop();
                            },
                            title: 'Live chat support',
                            leading: const Icon(CupertinoIcons.question_circle),
                          ),
                          const SettingsTile(
                            title: 'Logout',
                            leading: Icon(CupertinoIcons.escape),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
