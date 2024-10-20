import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';
import 'package:hayrat_osmanlica_elif_ba/theme/text_styles.dart';
import 'package:hayrat_osmanlica_elif_ba/view/home/home_view.dart';

///  Todo --> [hatGecisAcikMi] ? gecis_yap : gecis_yapma
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
          padding: const EdgeInsets.only(right: 6, top: 5, bottom: 5, left: 8),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ح',
                style: homeViewModel.isRika
                    ? TextStyles.rikaKelimeler.copyWith(color: primaryColor, fontSize: 18)
                    : context
                        .textTheme()
                        .labelSmall!
                        .copyWith(color: primaryColor, fontSize: 18),
              ),
              const Gap(2),
              Text(
                homeViewModel.isRika ? 'Rika' : 'Matbu',
                style: context
                    .textTheme()
                    .labelSmall!
                    .copyWith(color: primaryColor, letterSpacing: 0),
              ),
            ],
          ),
        ),
      );
    });
  }
}
