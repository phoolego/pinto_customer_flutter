import 'package:flutter/material.dart';
import 'package:pinto_customer_flutter/constant.dart';

class PintoTextFieldWithoutHintText extends StatelessWidget {
  String label = '';
  String initValue = '';
  bool isPassword = false;
  var validator;
  var onChanged;
  int? min;
  int? max;

  PintoTextFieldWithoutHintText(
      {required this.label, this.validator, this.onChanged, this.max, this.min, this.initValue='', this.isPassword=false});

  PintoTextFieldWithoutHintText.withoutAny() {
    this.label = 'อีเมล';
    this.validator = (String val) {};
    this.onChanged = (String val) {};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: kContentTextBlack,
            ),
          ),
          Padding(
            padding: EdgeInsets.zero,
            child: TextFormField(
              decoration: const InputDecoration(
                // hasFloatingPlaceholder: true,
                // hintText: 'gdsagasdg',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              initialValue: initValue,
              obscureText: isPassword,
              validator: validator,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}