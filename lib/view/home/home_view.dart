import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'home_view_model.dart';
import 'widgets/dersler_list_view.dart';
import 'widgets/konular_list_view.dart';

final HomeViewModel homeViewModel = HomeViewModel();

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    homeViewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SvgPicture.asset('assets/icons/menu.svg', width: 18),
          const SizedBox(width: 20)
        ],
        leadingWidth: 65,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: homeViewModel.setRika,
            child: SvgPicture.asset(
              'assets/icons/marka.svg',
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 20),
            child: Text("Konular", style: Theme.of(context).textTheme.titleMedium),
          ),
          const Gap(12),
          const KonularListView(),
          const Gap(32),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text("Dersler", style: Theme.of(context).textTheme.titleSmall),
          ),
          const Gap(30),
          const DerslerListView()
        ],
      ),
    );
  }
}
