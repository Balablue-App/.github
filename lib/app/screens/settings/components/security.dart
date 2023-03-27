import 'package:c/app/screens/settings/components/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:keepsettings/keepsettings.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.cancel),
          label: const Text('Back'),
          style: ElevatedButton.styleFrom(elevation: 0, primary: Colors.red),
        ),
        backgroundColor: Colors.white,
        title: const Align(
            alignment: Alignment.center,
            child: Text(
              'Notification',
              style: TextStyle(color: Colors.blue),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: SettingsList(sections: [
                  TilesSection(
                    title: 'Confrence meeting',
                    // ignore: prefer_const_literals_to_create_immutables
                    tiles: [
                      SettingsTile(
                        onPressed: (_) {
                          Get.to(Notifications());
                        },
                        title: 'Notification',
                        leading: Icon(CupertinoIcons.bell),
                      ),
                    ],
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
