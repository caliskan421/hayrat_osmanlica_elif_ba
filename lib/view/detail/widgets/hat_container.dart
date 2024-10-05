import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/theme/light_theme.dart';

class HatContainer extends StatelessWidget {
  const HatContainer({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 68,
      decoration: const BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'ع',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: color, fontSize: 18),
          ),
          Text(
            'Rika',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
