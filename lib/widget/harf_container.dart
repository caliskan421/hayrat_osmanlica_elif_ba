import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
          color: color, borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: titleColor),
          ),
          Text(
            icon,
            // TODO --> font degistir... parametre ekle...
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: iconColor),
          ),
        ],
      ),
    );
  }
}
