import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.child, required this.onPressed}) : super(key: key);
  final Widget child;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

      onPressed: onPressed,
    );
  }
}