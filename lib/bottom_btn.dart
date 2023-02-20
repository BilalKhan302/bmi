import 'package:flutter/material.dart';

import 'constants.dart';
class BottomButton extends StatelessWidget {
  const BottomButton({Key? key, required this.label, required this.onTapped}) : super(key: key);
  final String label;
  final Function()? onTapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        child: Center(
          child: Text(label,
            style: kLargeButtonTextStyle,),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}