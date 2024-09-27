import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hayrat_osmanlica_elif_ba/view/home/widgets/konular_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    log("CALISTI");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            Text(
              "Konular",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(12),
            const KonularListView(),
            const Gap(36),
            Text(
              "Dersler",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Gap(36),
            Row(
              children: [
                const Gap(10),
                Text(
                  "1        Osmanlıca",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            Row(
              children: [
                const Gap(10),
                Text(
                  "2       ElifBa",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            Row(
              children: [
                const Gap(10),
                Text(
                  "3       Uygulaması",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
