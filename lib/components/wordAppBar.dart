import 'package:flutter/material.dart';

AppBar wordAppBar() {
  return AppBar(
    leading: Container(),
    centerTitle: true,
    backgroundColor: Colors.blueGrey,
    title: Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(7),
      child: const Text(
        "Word Puzzle",
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
