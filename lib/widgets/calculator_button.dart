import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String buttonText;
  final void Function() buttonTapped;
  final double buttonRadius;

  const CalcButton(
      {Key? key,
        required this.color,
        required this.textColor,
        required this.buttonText,
        required this.buttonTapped,
        required this.buttonRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(buttonRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}