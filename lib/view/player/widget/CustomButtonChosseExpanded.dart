import 'package:flutter/material.dart';

Expanded CustomButtonChosseExpanded(Color color) {
  return Expanded(
    child: Container(
      height: 150,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 2)),
          ]),
      child: const TextButton(
        onPressed: null,
        child: Text("answer"),
      ),
    ),
  );
}