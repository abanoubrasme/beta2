import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/font.dart';
import '../../../core/decoration/Colors.dart';

class RankBox extends StatelessWidget {

  int rank ;
  String text ;
   RankBox({super.key,required this.rank ,required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: ColorC.teal,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(0, 2)),
            ]
        ),
        child: Row(children: [
          const SizedBox(width: 10,),
          Text("$text :   $rank",style: TextStyle(color: ColorC.white,fontSize: 22,
              fontFamily: Font.f1),)
        ],),
      ),
    );
  }
}
