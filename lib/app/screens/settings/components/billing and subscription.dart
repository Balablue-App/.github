import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/custom_colors.dart';

class Billings extends StatefulWidget {
  const Billings({super.key});

  @override
  State<Billings> createState() => _BillingsState();
}

class _BillingsState extends State<Billings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseWhite,
      appBar: AppBar(
        backgroundColor: CustomColors.firebaseWhite,
        leadingWidth: 100,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_left_sharp,
            color: Colors.blue,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: 300,
              height: 200,
              child: Card(
                color: CustomColors.firebaseGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ListView(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 40, 20, 30),
                      child: Column(
                        children: [
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: 'Premium features ',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blue)),
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(CupertinoIcons.tag),
                              ),
                            ),
                          ])),
                          const Align(
                              alignment: Alignment.center,
                              child: Text('#20,000/month')),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        '❤ Over 100 participants on a virtual Townhall',
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        '❤ Revisit a meeting anytime with the amazing recording feature.',
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        '❤ Privately Interact with another participant while in a meeting.',
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        '❤Join and create as many groups as possible.',
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          )
                        ],
                      ))
                ]),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 300,
              height: 200,
              child: Card(
                color: CustomColors.firebaseGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ListView(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 40, 20, 30),
                      child: Column(
                        children: [
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: 'Free features ',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blue)),
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0),
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    CupertinoIcons.tag,
                                  ),
                                ),
                              ),
                            ),
                          ])),
                          const Align(
                              alignment: Alignment.center,
                              child: Text('Free/month')),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        '❤ Limited no of people on the space.',
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: '❤ Meeting histories for a month.',
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: '❤Meeting time would be limited.',
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: '❤ Minimum no of groups to create.',
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          )
                        ],
                      ))
                ]),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 170,
              height: 70,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 23, 93, 121)),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
