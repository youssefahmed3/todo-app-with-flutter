import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
  border: const OutlineInputBorder(),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(width: 3, color: Colors.blue),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(width: 3, color: Colors.red),
    borderRadius: BorderRadius.circular(14),
  ),
);

var checkFalseText = const TextStyle(fontSize: 30);

var checkTrueText =
    const TextStyle(decoration: TextDecoration.lineThrough, fontSize: 30);

var checkFalseSubtitle = const TextStyle(fontSize: 15);

var checkTrueSubtitle =
    const TextStyle(decoration: TextDecoration.lineThrough, fontSize: 15);
