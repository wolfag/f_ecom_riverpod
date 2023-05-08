// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:f_ecom_riverpod/constants/themes.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap(label);
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 4.5),
      ),
      child: Chip(
        avatar: const Icon(
          Icons.mobile_friendly,
          size: 13,
          color: Color(0xff6A6C6D),
        ),
        label: Text(
          label,
          style: const TextStyle(
            color: Color(0xff6A6C6D),
            fontSize: 10.21,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: kWhiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 7),
      ),
    );
  }
}
