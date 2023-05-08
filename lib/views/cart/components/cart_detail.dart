import 'package:f_ecom_riverpod/constants/themes.dart';
import 'package:f_ecom_riverpod/controllers/cart_controller.dart';
import 'package:f_ecom_riverpod/views/cart/components/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartDetail extends HookConsumerWidget {
  const CartDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final couponController = useTextEditingController(text: '');
    final couponValidate = useState('');
    final showValidate = useState(false);
    final couponValidateColor = useState(kBlackColor);

    useEffect(() {
      void listener() {
        final coupon = couponController.text;
        if (coupon.isNotEmpty) {
          if (coupon.toUpperCase().startsWith("T")) {
            couponValidate.value = 'Available';
            couponValidateColor.value = Color(0xff3AC6A5);
          } else {
            couponValidate.value = 'Unavailable';
            couponValidateColor.value = Color.fromARGB(255, 198, 100, 58);
          }
          showValidate.value = true;
        } else {
          showValidate.value = false;
        }
      }

      couponController.addListener(listener);

      return () {
        couponController.removeListener(listener);
      };
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Have a coupon code? enter here',
          style: TextStyle(
            color: kTextBodyColor,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(11),
        SizedBox(
          child: TextFormField(
            enabled: ref.watch(subTotalProvider) > 0,
            controller: couponController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              hintText: 'Type here',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              suffixIcon: showValidate.value
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          couponValidate.value,
                          style: TextStyle(
                            color: couponValidateColor.value,
                          ),
                        ),
                        const Gap(16),
                        Icon(
                          Icons.check_circle,
                          color: couponValidateColor.value,
                        ),
                        const Gap(20),
                      ],
                    )
                  : null,
            ),
          ),
        ),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Subtotal:',
              style: AppTheme.kCartTitle,
            ),
            Text(
              '\$${ref.watch(subTotalProvider)}',
              style: AppTheme.kCartTitle,
            ),
          ],
        ),
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Delivery Free:',
              style: AppTheme.kCartTitle,
            ),
            Text(
              '\$$kDeliveryFree',
              style: AppTheme.kCartTitle,
            ),
          ],
        ),
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Discount:',
              style: AppTheme.kCartTitle,
            ),
            Text(
              '$kDiscount%',
              style: AppTheme.kCartTitle,
            ),
          ],
        ),
        const Gap(10),
        const DashedLine(
          color: kTextBodyColor,
          height: 1,
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total:',
              style: AppTheme.kTotalStyle,
            ),
            Text(
              '\$${ref.watch(
                totalProvider(
                  const TotalParams(
                    discount: kDiscount,
                    deliveryFree: kDeliveryFree,
                  ),
                ),
              )}',
              style: AppTheme.kTotalStyle,
            ),
          ],
        ),
        const Gap(15),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 55),
            backgroundColor: kPrimaryColor,
          ),
          onPressed: ref.watch(subTotalProvider) == 0 ? null : () {},
          child: const Text(
            'Continue to Checkout',
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
