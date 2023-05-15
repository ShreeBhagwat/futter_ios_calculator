import 'package:flutter/material.dart';
import 'package:futter_ios_calculator/constant.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.containerWidth,
    required this.onNumberClick,
    required this.numberTitle,
    this.isFunctionalityButton = false,
    this.isUpperButton = false,
    this.buttonHeight,
  });

  final String numberTitle;
  final double containerWidth;
  final Function() onNumberClick;
  final bool isFunctionalityButton;
  final bool isUpperButton;
  final double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onNumberClick,
      child: Container(
        decoration: BoxDecoration(
          color: isFunctionalityButton
              ? functionalityButtonColor
              : isUpperButton
                  ? upperButtonColor
                  : buttonColor,
          border: Border.all(
            color: backgroundColor,
            width: 1,
          ),
        ),
        height: buttonHeight ?? containerWidth,
        width: containerWidth,
        child: Center(
          child: Text(
            numberTitle,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
