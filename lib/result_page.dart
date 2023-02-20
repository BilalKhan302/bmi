import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'bottom_btn.dart';
import 'common_container.dart';
class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.bmiResult, required this.resultText, required this.Interpertation}) : super(key: key);
  final String bmiResult;
  final String resultText;
  final String Interpertation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            child: Text("Your Result",style: kTitleTextStyle,),
          )),
          Expanded(
            flex: 5,
              child: CommonContainer(
                containerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(),
                    style: kResultTextStyle,),
                    Text(bmiResult,
                    style: kBMITextStyle,),
                    Text(
                      Interpertation,
                      textAlign: TextAlign.center,
                      style:kBodyTextStyle,
                    ),

                  ],
                ),
                clr: kActiveCardColour,
                onPress: () {

                },) ),
          BottomButton(label: "RE-CALCULATE", onTapped: (){
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}
