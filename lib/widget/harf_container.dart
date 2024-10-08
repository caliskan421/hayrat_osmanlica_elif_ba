import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';

import '../theme/text_styles.dart';

class HarfContainer extends StatelessWidget {
  const HarfContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.isDottedBorder,
    required this.color,
    required this.titleColor,
    required this.iconColor,
  });

  final String title;
  final String icon;
  final bool isDottedBorder;
  final Color color;
  final Color titleColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      height: 101,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color, borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: [
          Text(
            title,
            style: context.textTheme().bodyLarge!.copyWith(color: titleColor),
          ),
          Text(
            icon,
            style: TextStyles.matbu.copyWith(color: iconColor),
          ),
        ],
      ),
    );
  }
}
