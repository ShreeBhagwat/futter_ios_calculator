import 'package:flutter/material.dart';
import 'package:futter_ios_calculator/constant.dart';

import 'common_button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int answer = 0;
  double firstValue = 0;
  double secondValue = 0;
  bool isAddition = false;
  bool isSubtraction = false;
  bool isMultiplication = false;
  bool isDivision = false;
  bool isSecondValue = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double containerWidth = width / 4;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomRight,
                width: width,
                child: Text(
                  answer.toString(),
                  style: answerTextStyle,
                ),
              ),
            ),
            Row(
              children: [
                CommonButton(
                    isUpperButton: true,
                    numberTitle: 'AC',
                    containerWidth: containerWidth,
                    onNumberClick: resetCalculator),
                CommonButton(
                    isUpperButton: true,
                    numberTitle: '+/-',
                    containerWidth: containerWidth,
                    onNumberClick: resetCalculator),
                CommonButton(
                    isUpperButton: true,
                    numberTitle: '%',
                    containerWidth: containerWidth,
                    onNumberClick: resetCalculator),
                CommonButton(
                    isFunctionalityButton: true,
                    numberTitle: '÷',
                    containerWidth: containerWidth,
                    onNumberClick: () => functionalityButtonPressed('÷')),
              ],
            ),
            Row(
              children: [
                CommonButton(
                    numberTitle: '7',
                    containerWidth: containerWidth,
                    onNumberClick: () => commonButtonPressed(7)),
                CommonButton(
                    numberTitle: '8',
                    containerWidth: containerWidth,
                    onNumberClick: () => commonButtonPressed(8)),
                CommonButton(
                    numberTitle: '9',
                    containerWidth: containerWidth,
                    onNumberClick: () => commonButtonPressed(9)),
                CommonButton(
                    isFunctionalityButton: true,
                    numberTitle: 'x',
                    containerWidth: containerWidth,
                    onNumberClick: () => functionalityButtonPressed('x')),
              ],
            ),
            Row(
              children: [
                CommonButton(
                    numberTitle: '4',
                    containerWidth: containerWidth,
                    onNumberClick: () => commonButtonPressed(4)),
                CommonButton(
                    numberTitle: '5',
                    containerWidth: containerWidth,
                    onNumberClick: () => commonButtonPressed(5)),
                CommonButton(
                    numberTitle: '6',
                    containerWidth: containerWidth,
                    onNumberClick: () => commonButtonPressed(6)),
                CommonButton(
                    isFunctionalityButton: true,
                    numberTitle: '-',
                    containerWidth: containerWidth,
                    onNumberClick: () => functionalityButtonPressed('-')),
              ],
            ),
            Row(
              children: [
                CommonButton(
                    numberTitle: '1',
                    containerWidth: containerWidth,
                    onNumberClick: () => commonButtonPressed(1)),
                CommonButton(
                    numberTitle: '2',
                    containerWidth: containerWidth,
                    onNumberClick: () => commonButtonPressed(2)),
                CommonButton(
                    numberTitle: '3',
                    containerWidth: containerWidth,
                    onNumberClick: () => commonButtonPressed(3)),
                CommonButton(
                    isFunctionalityButton: true,
                    numberTitle: '+',
                    containerWidth: containerWidth,
                    onNumberClick: () => functionalityButtonPressed('+')),
              ],
            ),
            Row(
              children: [
                CommonButton(
                    numberTitle: '0',
                    containerWidth: containerWidth * 2,
                    buttonHeight: containerWidth,
                    onNumberClick: resetCalculator),
                CommonButton(
                    numberTitle: '.',
                    containerWidth: containerWidth,
                    onNumberClick: resetCalculator),
                CommonButton(
                    isFunctionalityButton: true,
                    numberTitle: '=',
                    containerWidth: containerWidth,
                    onNumberClick: () => isEqualToButtonPressed()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void resetCalculator() {
    setState(() {
      isSecondValue = false;
      answer = 0;
      firstValue = 0;
      secondValue = 0;
      isAddition = false;
    isSubtraction = false;
    isMultiplication = false;
    isDivision = false;
    });
  }

  void commonButtonPressed(int number) {
    answer = number;
    if (!isSecondValue) {
      firstValue = answer.toDouble();
    } else {
      secondValue = answer.toDouble();
    }
    setState(() {});
  }

  void functionalityButtonPressed(String functionality) {
    isSecondValue = true;
    isAddition = false;
    isSubtraction = false;
    isMultiplication = false;
    isDivision = false;
    switch (functionality) {
      case '+':
        isAddition = true;
        break;
      case '-':
        isSubtraction = true;
        break;
      case 'x':
        isMultiplication = true;
        break;
      case '÷':
        isDivision = true;
        break;
      default:
    }
  }

  void isEqualToButtonPressed() {
    setState(() {
      if (isAddition) {
        answer = (firstValue + secondValue).toInt();
      } else if (isSubtraction) {
        answer = (firstValue - secondValue).toInt();
      } else if (isMultiplication) {
        answer = (firstValue * secondValue).toInt();
      } else if (isDivision) {
        answer = (firstValue / secondValue).toInt();
      }
    });
  }
}
