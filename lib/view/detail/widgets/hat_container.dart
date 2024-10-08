import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';
import 'package:hayrat_osmanlica_elif_ba/view/home/home_view.dart';

class HatContainer extends StatelessWidget {
  const HatContainer({
    super.key,
    required this.primaryColor,
    required this.secondaryColor,
  });

  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () {
          homeViewModel.setRika();
        },
        child: Container(
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
                'ح',
                style: context
                    .textTheme()
                    .labelSmall!
                    .copyWith(color: primaryColor, fontSize: 18),
              ),
              const Gap(5),
              Text(
                homeViewModel.isRika ? 'Rika' : 'Matbu',
                style: context.textTheme().labelSmall!.copyWith(color: primaryColor),
              ),
            ],
          ),
        ),
      );
    });
  }
}
