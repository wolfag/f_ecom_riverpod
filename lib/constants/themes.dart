import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff843667);
const kSecondColor = Color(0xff022238);
const kThirdColor = Color(0xffFFDCBC);
const kLightBackground = Color(0xffE8F6FB);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;
const kTextBodyColor = Color(0xff8D969F);
const kBackgroundColor = Color(0xffE2E2E2);
const kLinkColor = Color(0xff20ACFD);

const kDeliveryFree = 5.0;
const kDiscount = 25.0;

class AppTheme {
  static const kBigTitleStyle = TextStyle(
    color: kWhiteColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const kBodyTextStyle = TextStyle(
    color: kTextBodyColor,
    fontWeight: FontWeight.w300,
    fontSize: 11,
  );

  static const kHeaderStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: kBlackColor,
  );

  static const kLinkStyle = TextStyle(
    color: kLinkColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const kCartTitle = TextStyle(
    color: kBlackColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const kTotalStyle = TextStyle(
    color: kPrimaryColor,
    fontSize: 19,
    fontWeight: FontWeight.w600,
  );
}
