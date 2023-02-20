import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({Key? key, required this.clr, required this.containerChild, this.onPress}) : super(key: key);
  final Color clr;
  final Widget containerChild;
  final Function()?onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration:
        BoxDecoration(color: clr, borderRadius: BorderRadius.circular(10.0)),
        child: containerChild,
      ),
    );
  }
}