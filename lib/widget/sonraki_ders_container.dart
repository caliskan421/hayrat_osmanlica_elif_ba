import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';

import '../theme/light_theme.dart';

class SonrakiDersContainer extends StatelessWidget {
  const SonrakiDersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(15),
          height: 215,
          width: 345,
          decoration: BoxDecoration(
            color: context.colorScheme().surfaceBright,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: context.colorScheme().scrim),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              siradakiDers(context),
              sonrakiKonu(context),
              sonrakiDers(context),
              nextCircleAvatar(context),
            ],
          ),
        ),
      ),
    );
  }

  Container siradakiDers(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: 110,
      decoration: BoxDecoration(
        color: context.colorScheme().primary,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Center(
        child: Text(
          "Sıradaki Ders",
          style: context.textTheme().labelMedium!.copyWith(
                color: context.colorScheme().scrim,
              ),
        ),
      ),
    );
  }

  Text sonrakiKonu(BuildContext context) {
    return Text(
      "Harfler",
      style:
          context.textTheme().bodyMedium!.copyWith(color: context.colorScheme().primary),
    );
  }

  Text sonrakiDers(BuildContext context) {
    return Text(
      "Harflerin Rik’a Hattı Yazılışları",
      style: context.textTheme().titleSmall,
    );
  }

  CircleAvatar nextCircleAvatar(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.colorScheme().scrim,
      child: SvgPicture.asset(
        'assets/icons/arrow_right_alt.svg',
        color: context.colorScheme().primary,
      ),
    );
  }
}
