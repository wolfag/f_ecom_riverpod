import 'package:f_ecom_riverpod/constants/themes.dart';
import 'package:f_ecom_riverpod/views/home/components/filter_item.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            FilterItem(
              label: 'All',
              onTap: (p0) {
                print(p0);
              },
            ),
            FilterItem(
              label: 'Computers',
              onTap: (p0) {},
            ),
            FilterItem(
              label: 'Headsets',
              onTap: (p0) {},
            ),
            FilterItem(
              label: 'speakers',
              onTap: (p0) {},
            ),
          ],
        ),
      ),
    );
  }
}
