// ignore_for_file: must_be_immutable

library calculator;

import 'package:calculator/widgets/calculator_button.dart';
import 'package:calculator/widgets/error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class FlutterAwesomeCalculator extends StatefulWidget {
  BuildContext context;

  ///Height of the calculator
  double? height;

  ///Color for the "C" button of the calculator
  Color? clearButtonColor;

  ///Color for all the arithmetic buttons of the calculator
  Color? operatorsButtonColor;

  ///Color for the all the digits button of the calculator
  Color? digitsButtonColor;

  ///Color for calculator input expression
  Color? expressionAnswerColor;

  ///Radius of calculator buttons
  double? buttonRadius;

  ///Background color of the calculator
  Color? backgroundColor;

  ///Number of digits allowed after decimal point, if fractionDigits:2, then answer will
  ///be rounded to 1.00
  int? fractionDigits;

  ///Bool value for showing answer field of the calculator, if false then only calculator will be displayed
  bool? showAnswerField;
  void Function(String answer, String expression)? onChanged;

  FlutterAwesomeCalculator(
      {Key? key,
      required this.context,
      this.height,
      this.digitsButtonColor,
      this.operatorsButtonColor,
      this.clearButtonColor,
      this.buttonRadius,
      this.backgroundColor,
      this.expressionAnswerColor,
      this.fractionDigits,
      this.showAnswerField,
      this.onChanged})
      : super(key: key);

  @override
  State<FlutterAwesomeCalculator> createState() =>
      _FlutterAwesomeCalculatorState();
}

class _FlutterAwesomeCalculatorState extends State<FlutterAwesomeCalculator> {
  late Color clearButtonColor;
  late Color operatorsButtonColor;
  late Color digitsButtonColor;
  late Color backgroundColor;
  late double buttonRadius;
  late Color expressionAnswerColor;
  late int fractionDigits;
  late bool showAnswerField;
  String expression = '';
  String userInput = '';
  String answer = '';
  double answerFontSize = 12;
  bool invalid = false;

  Color buttonColor = Colors.red;

  @override
  void initState() {
    super.initState();
    clearButtonColor = widget.clearButtonColor ?? Colors.blue.shade500;
    operatorsButtonColor = widget.operatorsButtonColor ?? Colors.blue.shade200;
    digitsButtonColor = widget.digitsButtonColor ?? Colors.white;
    buttonRadius = widget.buttonRadius ?? 8.0;
    backgroundColor = widget.backgroundColor ?? Colors.blueGrey;
    expressionAnswerColor = widget.expressionAnswerColor ?? Colors.black;
    fractionDigits = widget.fractionDigits ?? 1;
    showAnswerField = widget.showAnswerField ?? false;
  }

  final List<String> buttons = [
    'C', //0
    '/', //1
    '%', //2
    'DEL', //3
    '7', //4
    '8', //5
    '9', //6
    '+', //7
    '4', //8
    '5', //9
    '6', //10
    'x', //11
    '1', //12
    '2', //13
    '3', //14
    '-', //15
    '0', //16
    '.', //17
    '+/-', //18
    '=', //19
  ];

  calculator() {
    return Container(
      height: widget.height ?? 400,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          showAnswerField
              ? Container(
                  width: double.infinity,
                  height: widget.height != null ? widget.height! / 6 : 80,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              userInput.isEmpty ? ' ' : userInput,
                              style: TextStyle(
                                  color: expressionAnswerColor, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              answer.isEmpty ? ' ' : answer,
                              style: TextStyle(
                                  fontSize: answerFontSize,
                                  color: expressionAnswerColor),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: !showAnswerField
                  ? widget.height
                  : widget.height != null
                      ? widget.height! / 1.2
                      : 320,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(0),
                                  buttonText: buttons[0],
                                  color: clearButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(1),
                                  buttonText: buttons[1],
                                  color: operatorsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(11),
                                  buttonText: buttons[11],
                                  color: operatorsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(4),
                                  buttonText: buttons[4],
                                  color: digitsButtonColor,
                                  buttonRadius: buttonRadius,
                                  textColor: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(5),
                                  buttonText: buttons[5],
                                  color: digitsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(6),
                                  buttonText: buttons[6],
                                  color: digitsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(8),
                                  buttonText: buttons[8],
                                  color: digitsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(9),
                                  buttonText: buttons[9],
                                  color: digitsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(10),
                                  buttonText: buttons[10],
                                  color: digitsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(12),
                                  buttonText: buttons[12],
                                  color: digitsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(13),
                                  buttonText: buttons[13],
                                  color: digitsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(14),
                                  buttonText: buttons[14],
                                  color: digitsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(16),
                                  buttonText: buttons[16],
                                  color: digitsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                              Expanded(
                                child: CalcButton(
                                  buttonTapped: calculatorButtonPressed(17),
                                  buttonText: buttons[17],
                                  color: digitsButtonColor,
                                  textColor: Colors.black,
                                  buttonRadius: buttonRadius,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: CalcButton(
                            buttonTapped: calculatorButtonPressed(3),
                            buttonText: buttons[3],
                            color: operatorsButtonColor,
                            textColor: Colors.black,
                            buttonRadius: buttonRadius,
                          ),
                        ),
                        Expanded(
                          child: CalcButton(
                            buttonTapped: calculatorButtonPressed(7),
                            buttonText: buttons[7],
                            color: operatorsButtonColor,
                            textColor: Colors.black,
                            buttonRadius: buttonRadius,
                          ),
                        ),
                        Expanded(
                          child: CalcButton(
                            buttonTapped: calculatorButtonPressed(15),
                            buttonText: buttons[15],
                            color: operatorsButtonColor,
                            textColor: Colors.black,
                            buttonRadius: buttonRadius,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CalcButton(
                            buttonTapped: calculatorButtonPressed(19),
                            buttonText: buttons[19],
                            color: clearButtonColor,
                            textColor: Colors.black,
                            buttonRadius: buttonRadius,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  resetFontSize() {
    answerFontSize = 12;
  }

  Function() calculatorButtonPressed(int buttonIndex) {
    switch (buttonIndex) {

      /// clear button
      case 0:
        return () {
          setState(() {
            userInput = '';
            answer = '';
            resetInvalid();
            resetFontSize();
            if (widget.onChanged != null) {
              widget.onChanged!(answer, userInput);
            }
          });
        };

      /// % button
      case 2:
        return () {
          // otherButtonPressed(buttonIndex);
          // userInput += buttons[buttonIndex];
          // calculatorCubit.emitCalculatorValue(userInput);
        };

      ///delete button
      case 3:
        return () {
          if (userInput.isNotEmpty) {
            /// To restrict the user, when there is any digit in amount, then DEL button,
            /// will remove last digit, else will not.
            userInput = userInput.substring(0, userInput.length - 1);
            resetFontSize();
          }
          bool invalidResult = checkResultLength();
          if (!invalidResult) {
            resetInvalid();
          }
          setState(() {});
        };

      ///equal button
      case 19:
        return () {
          equalPressed();
        };

      case 1:
        return () {
          operatorButtonPressed(buttonIndex);
        };

      case 11:
        return () {
          operatorButtonPressed(buttonIndex);
        };

      case 7:
        return () {
          operatorButtonPressed(buttonIndex);
        };

      case 15:
        return () {
          operatorButtonPressed(buttonIndex);
        };

      case 17:
        return () {
          operatorButtonPressed(buttonIndex);
        };

      ///other buttons
      default:
        return () {
          digitButtonPressed(buttonIndex);
        };
    }
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void equalPressed() {
    if (userInput.isEmpty) {
      return;
    }
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    try {
      Expression exp = p.parse(finalUserInput);
      ContextModel cm = ContextModel();
      double evaluatedAnswer = exp.evaluate(EvaluationType.REAL, cm);
      answer = evaluatedAnswer.toStringAsFixed(fractionDigits);
    } catch (e) {
      ///to remove last operator value from expression e.g if user press 6+ and press equal
      ///we remove last + from expression
      finalUserInput = finalUserInput.substring(0, finalUserInput.length - 1);
      userInput = finalUserInput;
      equalPressed();
      return;
    }
    answerFontSize = 20;

    // userInput = amount.toStringAsFixed(2);
    // answer = userInput;

    setState(() {});
  }

  String previousAns = '';

  bool checkResultLength() {
    String finalAnswer = userInput;
    finalAnswer = userInput.replaceAll('x', '*');
    Parser parser = Parser();
    late double evaluatedAnswer;

    try {
      Expression exp = parser.parse(finalAnswer);
      ContextModel contextModel = ContextModel();
      evaluatedAnswer = exp.evaluate(EvaluationType.REAL, contextModel);
      answer = evaluatedAnswer.toStringAsFixed(fractionDigits);
      finalAnswer = answer.substring(0, answer.indexOf('.'));
      if (finalAnswer.length > 14) {
        userInput = userInput.substring(0, userInput.length - 1);
        invalid = true;
        answer = previousAns;
        showErrorSnackBar('Non supported value');
        return true;
      }
      previousAns = answer;
      return false;
    } catch (e) {
      return false;
    }
  }

  resetInvalid() {
    invalid = false;
  }

  showErrorSnackBar(String message) {
    ErrorSnackBar.showSnackBar(
        message: 'Non Supported value', context: widget.context);
  }

  operatorButtonPressed(int index) {
    resetInvalid();
    userInput += buttons[index];
    RegExp regExp = RegExp(r'^[0-9]+$');
    if (!(regExp.hasMatch(buttons[index])) && userInput.length == 1) {
      ///this If is use when user enter first digit an arithmetic operator, that is
      ///if user enter first digit +,- or any other, we won't allow to add into amount
      ///and remove from user input.
      userInput = '';
      return;
    }

    ///if user pressing any of below button again and again, it will replace with the last character
    ///e.g if value is 12+ and user press - , it will replace + with -.
    String lastChar = userInput.characters.elementAt(userInput.length - 2);

    if (lastChar == '+' ||
        lastChar == '-' ||
        lastChar == 'x' ||
        lastChar == '/' ||
        lastChar == '.') {
      userInput = userInput.substring(0, userInput.length - 2);
      userInput += buttons[index];
    } else {
      userInput = userInput.substring(0, userInput.length - 1);
      userInput += buttons[index];
    }
    setState(() {});
  }

  digitButtonPressed(int index) {
    ///if button tapped is operator button or not
    if (!invalid) {
      userInput += buttons[index];

      ///checking length of answer value and also negative number
      checkResultLength();

      if (widget.onChanged != null) {
        widget.onChanged!(answer, userInput);
      }
    } else {
      showErrorSnackBar('Non supported value');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return calculator();
  }
}
