import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Card.dart';
import 'constants.dart';
import 'Resultpage.dart';
import 'Functionality.dart';


enum Gender { male, female,none }


void main() {
  runApp(MaterialApp(
         theme:KAppTheme ,
         home: homescreen(),
         // routes: {
         //   'home' : (context)=>homescreen(),
         //   'result': (context)=>resultpage(),
         // },
  ));
}

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

  @override
  Gender selectedGender = Gender.none;
  int height = 180;
  int weight = 60 ;
  int age = 15;


  Widget build(BuildContext context) {
    return MaterialApp(
        theme: KAppTheme,
        home: Scaffold(
          appBar: KAppBarStyle,

          // App Layout Cards + bottom Container
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top 2 cards
              Expanded(
                child: Row(
                  children: [

                    // MALE CARD
                    Expanded(
                        child: Wigcard(selectedGender == Gender.male ? KActivecardcolor : KInactivecardcolor
                            , WigIcon(FontAwesomeIcons.mars, 'MALE',selectedGender == Gender.male ? KActivetextcolor : KInactivetextcolor)
                          ,(){
                          setState(() {
                            selectedGender=Gender.male;
                          });
                            })),

                    // FEMALE CARD
                    Expanded(
                      child: Wigcard(selectedGender==Gender.female? KActivecardcolor: KInactivecardcolor
                          , WigIcon(FontAwesomeIcons.venus, 'FEMALE',selectedGender == Gender.female ? KActivetextcolor : KInactivetextcolor)
                        ,(){setState(() {
                          selectedGender=Gender.female;
                        });}),
                    ),
                  ],
                ),
              ),

              // Height Card
              Expanded(child: Wigcard(KActivecardcolor,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT:',style: KNormalStyle),

                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(height.toString(),style: KBigStyle),
                        Text('cm')
                      ],),

                      SliderTheme(
                        data: SliderThemeData().copyWith(
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: RoundSliderThumbShape(enabledThumbRadius: 20),
                          thumbColor: KThumbcolor,
                          //TODO: Opacity of overlay color
                          overlayColor: KOverlaycolor,
                          overlappingShapeStrokeColor:KOverlaycolor ,
                        ),
                        child: Slider(value: height.toDouble(),
                            min: 120,
                            max: 220,
                            onChanged: (double newvalue){
                               setState(() {
                                 height=newvalue.toInt();
                               });
                            }),
                      )
                    ],),

                      (){})),

              // Bottom 2 cards
              Expanded(
                child: Row(
                  children: [

                    //Weight Card
                    Expanded(child: Wigcard(KActivecardcolor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT:',style: KNormalStyle),
                            Text(weight.toString(),style:KBigStyle),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(() {
                                  if(weight > 0)
                                    {
                                      setState(() {
                                        weight--;
                                      });
                                    }
                                }, FontAwesomeIcons.minus),

                                SizedBox(width: 10),

                                RoundIconButton(() {
                                 if(weight < 200)
                                   {
                                     setState(() {
                                       weight++;
                                     });
                                   }
                                }, FontAwesomeIcons.plus)
                              ],
                            )
                          ],
                        ),(){})),

                    //Age Card
                    Expanded(child: Wigcard(KActivecardcolor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE:',style: KNormalStyle),
                            Text(age.toString(),style: KBigStyle),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(() {
                                  if(age>0)
                                    {
                                      setState(() {
                                        age--;
                                      });
                                    }
                                }, FontAwesomeIcons.minus),

                                SizedBox(width: 10),

                                RoundIconButton(() {
                                  if(age < 100)
                                    {
                                      setState(() {
                                        age++;
                                      });
                                    }
                                }, FontAwesomeIcons.plus)
                              ],
                            )
                          ],
                        ),(){})),

                  ],
                ),
              ),

              // Calculate Button (Bottom Container)
              GestureDetector(
                onTap: (){
                  Calculate c = Calculate(height,weight);

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>resultpage(
                      c.GetBMINumCategory(),
                      c.CalculateBmi(),
                      c.GetInterpret()
                  )));

                },
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    child: Center(child: Text('CALCULATE',style:KBottomButtonTextStyle)),
                    width: double.infinity,
                    height: 50,
                    color: KBottomconatinercolor,
                  ),
                ),
              ),
            ],
          ),
        ),);
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.onPressed,this.I);

  final VoidCallback onPressed;
  final IconData I;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: Color(0xFF82879e),
        onPressed: onPressed,
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        child: Icon(I),
        elevation: 6,);
  }
}
