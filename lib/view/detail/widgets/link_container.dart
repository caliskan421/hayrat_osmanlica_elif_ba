import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';

class LinkContainer extends StatelessWidget {
  const LinkContainer({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12, left: 6, top: 6, bottom: 6),
      height: 51,
      width: 340,
      decoration: BoxDecoration(
        color: context.colorScheme().surfaceBright,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: context.colorScheme().scrim),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(0, 4), // Sadece alt taraf için gölge
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/osmanlica_online_logo.svg',
                width: 30,
                color: color,
              ),
              const Gap(4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'osmanlica.online',
                    style: context.textTheme().labelMedium!.copyWith(color: color),
                  ),
                  Text(
                    'Dersin videosunu izlemek için tıklayın',
                    style: context
                        .textTheme()
                        .labelSmall!
                        .copyWith(color: context.colorScheme().outline),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/icons/arrow_right.svg',
            color: color.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
