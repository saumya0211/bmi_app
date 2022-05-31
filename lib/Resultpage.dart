import 'main.dart';
import 'package:bmi_app/Card.dart';
import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class resultpage extends StatelessWidget {

  resultpage(this.bmiCategory,this.bmiNum,this.bmiInterpret);

  final String bmiCategory;
  final String bmiNum;
  final String bmiInterpret;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: KAppTheme,
      home: Scaffold(
        appBar: KAppBarStyle,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(padding:EdgeInsets.all(10),
                child: Text('Your Result',style: KBigStyle.copyWith(fontSize: 40))),
            
            Expanded(
              child: Wigcard(KActivecardcolor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:EdgeInsets.all(5),
                          child: Center(child: Text(bmiCategory,style: KNormalStyle.copyWith(color: Colors.green),))),

                      Center(child: Text(bmiNum,style: KBigStyle)),

                      Padding(padding:EdgeInsets.symmetric(horizontal: 20) ,
                          child: Center(child: Text(bmiInterpret,style: KNormalStyle)))
                    ],
                  ), (){}),
            ),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Container(
                  child: Center(child: Text('RE-CALCULATE',style: KBottomButtonTextStyle,)),
                  width: double.infinity,
                  height: 50,
                  color: KBottomconatinercolor,
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
