import 'package:f_ecom_riverpod/constants/assets_constants.dart';
import 'package:f_ecom_riverpod/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 33.0, right: 33, top: 6),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Apple Store',
                      style: AppTheme.kBigTitleStyle,
                    ),
                    const Gap(10),
                    Text(
                      "Find the Apple product and accessories you’re looking for",
                      style:
                          AppTheme.kBodyTextStyle.copyWith(color: kWhiteColor),
                    ),
                    const Gap(10),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Shop new Year',
                        style: TextStyle(
                          color: kThirdColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Image.asset(
                  AssetsConstants.landing,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
