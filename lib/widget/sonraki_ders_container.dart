import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';

import '../theme/light_theme.dart';

class SonrakiDersContainer extends StatelessWidget {
  const SonrakiDersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(15),
          height: 215,
          width: 345,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: AppColors.surfaceBright,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              siradakiDers(context),
              sonrakiKonu(context),
              sonrakiDers(context),
              nextCircleAvatar(),
            ],
          ),
        ),
      ),
    );
  }

  Container siradakiDers(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: 110,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Center(
        child: Text(
          "Sıradaki Ders",
          style: context.textTheme().labelMedium!.copyWith(color: AppColors.background),
        ),
      ),
    );
  }

  Text sonrakiKonu(BuildContext context) {
    return Text(
      "Harfler",
      style: context.textTheme().bodyMedium!.copyWith(color: AppColors.primary),
    );
  }

  Text sonrakiDers(BuildContext context) {
    return Text(
      "Harflerin Rik’a Hattı Yazılışları",
      style: context.textTheme().titleSmall,
    );
  }

  CircleAvatar nextCircleAvatar() {
    return CircleAvatar(
      backgroundColor: AppColors.background,
      child: SvgPicture.asset(
        'assets/icons/arrow_right_alt.svg',
        color: AppColors.primary,
      ),
    );
  }
}
