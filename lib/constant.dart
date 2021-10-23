import 'package:flutter/material.dart';

//heading
const kHeadingTextStyle = TextStyle(
  fontFamily: 'Prompt',
  fontSize: 18.0,
);
//content
const kContentTextWhiteBold =
    TextStyle(fontFamily: 'Prompt', fontSize: 16.0, color: deepWhite, fontWeight: FontWeight.bold);
const kContentTextWhite = TextStyle(
  fontFamily: 'Prompt',
  fontSize: 16.0,
  color: deepWhite,
);
const kContentTextBlackBold =
    TextStyle(fontFamily: 'Prompt', fontSize: 16.0, color: deepBlack, fontWeight: FontWeight.bold);
const kContentTextBlack = TextStyle(
  fontFamily: 'Prompt',
  fontSize: 16.0,
  color: deepBlack,
);

//BoxDecoration
var kCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(8.0),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: mediumGrayBackground,
      blurRadius: 2.0,
      spreadRadius: 0.0,
      offset: Offset(2.0, 2.0), // shadow direction: bottom right
    )
  ],
);
//status
const kStatusCompleteTextColor = TextStyle(fontFamily: 'Prompt', fontSize: 16.0, color: successGreen);
const kStatusWaitingTextColor = TextStyle(fontFamily: 'Prompt', fontSize: 16.0, color: waitingDeepYellow);
const kStatusNotCompleteTextColor = TextStyle(fontFamily: 'Prompt', fontSize: 16.0, color: notYetDeepRed);

const kAppbarTextStyle = TextStyle(fontFamily: 'Prompt', fontSize: 20.0, color: deepWhite);

const kLoginHeadingTextStyle = TextStyle(
  fontFamily: 'Prompt',
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
const kNormalErrorTextStyle = TextStyle(fontFamily: 'Prompt', fontSize: 16.0, color: notYetDeepRed);
//button
const buttonWhiteTextStyle = TextStyle(fontFamily: 'Prompt', fontSize: 14.0, color: deepWhite);
const buttonBlackTextStyle = TextStyle(fontFamily: 'Prompt', fontSize: 14.0, color: deepBlack);

//Customer's color
const Color deepGreen = Color(0xFF5C8C52);
const Color lightGreen = Color(0xFF84B67A);
//Status color
const Color successDeepGreen = Color(0xFF25AF43);
const Color successGreen = Color(0xFF3ADC5D);
const Color waitingDeepYellow = Color(0xFFEE8100);
const Color waitingYellow = Color(0xFFF6B26B);
const Color notYetDeepRed = Color(0xFFF5764E);
const Color notYetRed = Color(0xFFFF5959);
//Text color
const Color deepBlack = Color(0xFF000000);
const Color mediumBlack = Color(0xFF50555C);
const Color lightBlack = Color(0xFF979797);
const Color deepWhite = Color(0xFFFFFFFF);
//Background color
const Color deepGrayBackground = Color(0xFF979797);
const Color mediumGrayBackground = Color(0xFFE4E6E8);
const Color lightGrayBackground = Color(0xFFF1EFEF);
