import 'package:f_ecom_riverpod/constants/themes.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.headerText,
    required this.onSeeAll,
  });

  final String headerText;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerText,
          style: AppTheme.kHeaderStyle,
        ),
        InkWell(
          onTap: onSeeAll,
          child: const Text(
            'See all',
            style: AppTheme.kLinkStyle,
          ),
        ),
      ],
    );
  }
}
