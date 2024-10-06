import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';

import '../../../theme/light_theme.dart';

class LinkContainer extends StatelessWidget {
  const LinkContainer({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      width: 340,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 4), // Sadece alt taraf için gölge
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/icons/osmanlica_online_logo.svg',
            width: 30,
            color: color,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'osmanlica.online',
                style: context.textTheme().labelMedium!.copyWith(color: color),
              ),
              Text(
                'Dersin videosunu izlemek için tıklayın',
                style: context.textTheme().labelSmall!.copyWith(color: AppColors.outline),
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
