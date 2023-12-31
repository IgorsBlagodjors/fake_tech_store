import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:flutter/material.dart';

class CheckoutPaymentMethod extends StatelessWidget {
  const CheckoutPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 10),
      child: Row(
        children: [
          const Text(
            'Payment',
            style: AppStyles.body2BlackText,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Visa ***678',
                  style: AppStyles.body1darkBlue,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Expire 02/20',
                  style: AppStyles.font12Weight400.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Column(
            children: [
              Image.asset(
                'assets/icons/change_icon.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
