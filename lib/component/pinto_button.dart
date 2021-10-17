import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';

class PintoButton extends StatelessWidget {
  double width;
  String label = '';
  var function;
  Color buttonColor = lightGreen;
  TextStyle textStyle= buttonWhiteTextStyle;


  PintoButton(
      {this.width=200,
      required this.label,
      required this.function,
      required this.buttonColor,
      this.textStyle=buttonWhiteTextStyle});

  PintoButton.blackLabel(
      {this.width=200,
        required this.label,
        required this.function,
        required this.buttonColor,
        this.textStyle=buttonBlackTextStyle});

  PintoButton.custom(
      {required  this.width,
        required this.label,
        required this.function,
        required this.buttonColor,
        required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: InkWell(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
