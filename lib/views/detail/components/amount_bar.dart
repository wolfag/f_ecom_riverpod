// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AmountBar extends StatelessWidget {
  const AmountBar({
    Key? key,
    required this.amount,
    required this.onDecrement,
    required this.onIncrement,
  }) : super(key: key);

  final int amount;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onDecrement,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(
            Icons.do_not_disturb_on_outlined,
            color: Color(0xff022238),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            '$amount',
            style: const TextStyle(
              color: Color(0xff022238),
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
        ),
        IconButton(
          onPressed: onIncrement,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(
            Icons.add_circle_outline,
            color: Color(0xff022238),
          ),
        ),
      ],
    );
  }
}
