import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/font.dart';
import '../../../../core/decoration/Colors.dart';


//  CustomFloatingActionButton(Widget icon,Widget page,double width,double height) {
//   return GestureDetector(
//     onTap: () {
//       Get.to(page);
//     },
//     child: Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           boxShadow: const [
//             BoxShadow(
//                 blurRadius: 7,
//                 spreadRadius: 4,
//                 offset: Offset(0, 0),
//                 color: Colors.grey)
//           ],
//           color: Coloors.teal,
//           border: Border.all(color: Colors.white, width: 3),
//           shape: BoxShape.circle,
//         ),
//         child: icon
//     ),
//   );
// }
class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key,
    required this.icon,
    required this.page,
    required this.width,
    required this.height, required this.text});

  final Widget icon;
  final String page;
  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(page);
      },
      child: Container(
        height: 160,
        width: 150,
        decoration:  const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow:  [
            BoxShadow(
                blurRadius: 7,
                spreadRadius: 2,
                offset: Offset(0, 0),
                color: Colors.grey)
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                  height: height,
                  width: width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: icon
              ),
            const SizedBox(
              height: 20,
            ),
            Text(text,
              style: TextStyle(
              color: ColorC.teal,
                  fontSize: 22,
                  fontWeight: FontWeight.w100,
                  fontFamily: Font.f1),
              ),
          ],
        ),
      ),
    );
  }
}

