import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';
import 'package:hayrat_osmanlica_elif_ba/view/detail/detail_view_model.dart';

import '../../widget/harf_grid_view.dart';
import '../home/home_view.dart';
import 'widgets/hat_container.dart';
import 'widgets/link_container.dart';

final DetailViewModel detailViewModel = DetailViewModel();

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Color primaryColor = homeViewModel.aktifKonuModel!.colors.primaryColor!;
  Color secondaryColor = homeViewModel.aktifKonuModel!.colors.secondaryColor!;

  @override
  void initState() {
    super.initState();
    detailViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(18),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: SvgPicture.asset(
              'assets/icons/arrow_back_ios.svg',
              height: 10,
              width: 10,
            ),
          ),
        ),
        actions: [
          HatContainer(
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 16),
            child: SvgPicture.asset(
              'assets/icons/list_alt.svg',
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverAppBar(
              floating: true,
              centerTitle: false,
              pinned: false,
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              title: Text(
                detailViewModel.aktifDersModel!.title,
                style: context.textTheme().titleLarge,
                maxLines: 3,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              LinkContainer(color: primaryColor),
              const Gap(10),
            ]),
          ),
          SliverFillRemaining(
            child: HarfGridView(),
          ),
        ],
      ),
    );
  }
}

/*
 Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [


          ],
        ),
      ),
*/
