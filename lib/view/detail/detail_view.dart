import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/view/detail/widgets/link_container.dart';

import '../../model/ders_model.dart';
import '../../widget/harf_grid_view.dart';
import '../home/home_view.dart';
import 'widgets/hat_container.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late DersModel dersModel;
  late String dersTitle;
  Color color = homeViewModel.konuList[homeViewModel.aktifKonuId! - 1].color.color;

  @override
  void initState() {
    super.initState();

    dersModel = homeViewModel.aktifDers!;
    dersTitle = dersModel.title;
  }

  @override
  Widget build(BuildContext context) {
    log("Ders Title -> $dersTitle");
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
          HatContainer(color: color),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 16),
            child: SvgPicture.asset(
              'assets/icons/list_alt.svg',
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(dersTitle, style: Theme.of(context).textTheme.titleLarge),
            LinkContainer(color: color),
            const Expanded(child: HarfGridView()),
          ],
        ),
      ),
    );
  }
}

/*
Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(dersTitle, style: Theme.of(context).textTheme.titleLarge),
            const LinkContainer(),
            const Expanded(child: HarfGridView()),
          ],
        ),
      ),
*/
