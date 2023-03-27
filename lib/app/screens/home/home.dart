import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/customcard.dart';
import '../../widgets/clippingclass..dart';

class Home extends StatefulWidget {
  final User user;
  const Home({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static User? firebaseUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        children: <Widget>[
          ClipPath(
            clipper: ClippingClass(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 2 / 7,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.blue],
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
          Positioned(
            left: 20,
            top: 50,
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: IconButton(
                iconSize: 50,
                icon: const Icon(Icons.person),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\n\nHello ${widget.user.displayName}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 250,
            right: 10,
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        customCard(item: "Wash & iron", duration: "3 Days"),
                        const Text("Create a confrence"),
                      ],
                    ),
                  ),
                  SizedBox(width:40),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        customCard(item: "Wash", duration: "1 Day"),
                        const Text("Create a group"),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        customCard(item: "Deals", duration: ''),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        customCard(item: "Donate", duration: ""),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
