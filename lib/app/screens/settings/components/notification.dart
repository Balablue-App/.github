import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:keepsettings/keepsettings.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                    // ignore: prefer_const_literals_to_create_immutables
                    tiles: [
                      const SettingsTile(
                        title: 'Email notification',
                        leading: Icon(CupertinoIcons.mail),
                      ),
                      const SettingsTile(
                        title: 'Sms notification',
                        leading: Icon(CupertinoIcons.phone),
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
