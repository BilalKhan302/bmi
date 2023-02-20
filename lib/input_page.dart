import 'package:bmi/calculator_functionality.dart';
import 'package:bmi/result_page.dart';
import 'package:bmi/round_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_btn.dart';
import 'common_container.dart';
import 'constants.dart';
import 'icon_content.dart';
enum Gender {
  male,
  female,
}
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height=180;
  int weight=60;
  int age=19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: CommonContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    containerChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                    clr: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveContainerColour,
                  ),
                ),
                Expanded(
                    child: CommonContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                  containerChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: "FEMALE",
                  ),
                  clr: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveContainerColour,

                )),
              ],
            )),
            Expanded(
                child: CommonContainer(
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT",style: kLabelTextStyle,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style:kNumberTextStyle),
                      Text("cm",style: kLabelTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                    ),
                    child: Slider(value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue){
                      setState((){
                        height=newValue.round();

                      });
                      }
                    ),
                  )
                ],
              ),
              clr: kActiveCardColour,
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: CommonContainer(
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT",
                      style: kLabelTextStyle,),
                      Text(weight.toString(),
                      style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        RoundIconButton(onPressed: () {
                          setState((){
                            weight--;
                          });
                        },
                        child: Icon(FontAwesomeIcons.minus),),
                          SizedBox(width: 10.0,),
                         RoundIconButton(onPressed: () {
                           setState((){
                             weight++;
                           });
                         },
                         child: Icon(FontAwesomeIcons.plus),),
                        ],
                      )
                    ],
                  ),
                  clr: kActiveCardColour,
                )),
                Expanded(
                    child: CommonContainer(
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE",style: kLabelTextStyle,),
                      Text(age.toString(),style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(child: Icon(FontAwesomeIcons.minus),
                              onPressed: (){
                            setState((){
                              age--;
                            });
                              }),
                          SizedBox(width: 10.0,),
                          RoundIconButton(child: Icon(FontAwesomeIcons.plus),
                              onPressed: (){
                                setState((){
                                  age++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                  clr: kActiveCardColour,
                )),
              ],
            )),
           BottomButton(label: 'CALCULATE',
             onTapped: () {
             CalculatorBrain calc=CalculatorBrain(weight: weight, height: height, );
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
               bmiResult: calc.calculateBMI().toString(),
               resultText: calc.getResult().toString(),
               Interpertation: calc.getInter().toString(),)));
             },),
          ],
        ));
  }
}



