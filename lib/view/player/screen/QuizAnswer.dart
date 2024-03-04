import 'package:beta/view/player/widget/CustomButtonChosseExpanded.dart';
import 'package:flutter/material.dart';

import '../../../core/decoration/Colors.dart';


class QuizAnswer extends StatelessWidget {
  const QuizAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900.withOpacity(.5),
        centerTitle: true,
        title: const Text('ava'),
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel",
            //"${getLang(context, "Cancel")}",
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
        leadingWidth: 80,
        actions: [
          MaterialButton(
              onPressed: () {},
              child: const Text("Save",
                // '${getLang(context, "Save")}',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ))
        ],
      ),
      body: ListView(
        children: [
          //
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    margin:
                    const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.indigo.shade900.withOpacity(.5),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(2, 4)),
                        ]),
                    child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '5  Second',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                  onTap: () {},
                ),
              ),

            ],
          ),
          Container(
            height: 260,
            width: Material.defaultSplashRadius,
            decoration: BoxDecoration(color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 2)),
                ]),
            margin: const EdgeInsets.all(10),
            child: const Center(
                child: Text("answer"),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomButtonChosseExpanded(ColorC.red),
                    CustomButtonChosseExpanded(ColorC.amber),
                  ],
                ),
                Row(
                  children: [
                    CustomButtonChosseExpanded(ColorC.blue),
                    CustomButtonChosseExpanded(ColorC.green),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
