import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';

class HatContainer extends StatelessWidget {
  const HatContainer(
      {super.key, required this.primaryColor, required this.secondaryColor});

  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'ع',
            style: context
                .textTheme()
                .labelSmall!
                .copyWith(color: primaryColor, fontSize: 18),
          ),
          const Gap(5),
          Text(
            'Rika',
            style: context.textTheme().labelSmall!.copyWith(color: primaryColor),
          ),
        ],
      ),
    );
  }
}
