import 'package:beta/core/decoration/Colors.dart';
import 'package:flutter/material.dart';


class SlideBackground extends StatelessWidget {
  Color color ;
  String text ;
  IconData icon ;
  AlignmentGeometry alignment;
  EdgeInsetsGeometry padding ;
   SlideBackground({super.key, required this.color, required this.text,
     required this.icon,required this.alignment,required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child:  Padding(
        padding: padding,
        child: Align(
          alignment:alignment,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
               Icon(
                icon ,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(height: 5,),
              Text( text,
                style:  TextStyle(
                    color: ColorC.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 17),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
