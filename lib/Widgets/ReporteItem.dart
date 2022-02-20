import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ReportItem extends StatelessWidget {

  String imagePath,title,subtitle;
   ReportItem({Key? key,required this.imagePath,required this.title,required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 4),
      child: new Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ImageIcon(AssetImage(imagePath),size: 55,color: HexColor("#CECECE"),),
            SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: const Color(0xff3b3b4d),
                fontWeight: FontWeight.w500,
                height: 1.1538461538461537,
              ),
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 30,
                color: const Color(0xfffd8200),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
