import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hayrat_osmanlica_elif_ba/theme/light_theme.dart';
import 'package:hayrat_osmanlica_elif_ba/view/home/widgets/dersler_list_view.dart';
import 'package:hayrat_osmanlica_elif_ba/view/home/widgets/konular_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    log("CALISTI");
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        actions: [
          SvgPicture.asset('assets/icons/menu.svg', width: 24),
          const SizedBox(width: 20)
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SvgPicture.asset('assets/icons/marka.svg'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Konular", style: Theme.of(context).textTheme.titleMedium),
            const Gap(12),
            KonularListView(),
            const Gap(36),
            Text("Dersler", style: Theme.of(context).textTheme.titleSmall),
            const Gap(36),
            DerslerListView()
          ],
        ),
      ),
    );
  }
}
