import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class Wigcard extends StatelessWidget {
  Wigcard(this.c, this.cardChild ,this.onPress);
  final Color c;
  final Widget cardChild;
  final VoidCallback onPress ;

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container
        (
        margin: EdgeInsets.all(15),
        child: cardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: c,
        ),
      ),
    );

  }
}

Widget WigIcon(IconData a, String b,Color c) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(a, size: 80,color: c,),
      SizedBox(height: 20),
      Text(b,style: TextStyle(color: c,fontWeight: FontWeight.w500)),
    ],),
  );
}
