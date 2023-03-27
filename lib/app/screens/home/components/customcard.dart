import 'package:flutter/material.dart';

customCard({required String item, required String duration}) {
  return SizedBox(
    width: 110,
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(duration)
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
