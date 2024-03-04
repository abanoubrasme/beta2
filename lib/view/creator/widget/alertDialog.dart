import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("Are you sure you want to delete this quiz?"),
      actions: <Widget>[
        TextButton(
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text(
            "Delete",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

Widget slideRightBackground() {
  return Container(
    color: Colors.green,
    child: const Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.edit,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              " Edit",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: const Padding(
      padding: EdgeInsets.only(top: 18, bottom: 18, right: 30),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              " Delete",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
