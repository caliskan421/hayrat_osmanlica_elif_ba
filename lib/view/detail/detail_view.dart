import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

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
  String dersTitle = '';
  late int dersId;
  @override
  void initState() {
    super.initState();
    DersModel? dersModel = homeViewModel.aktifDers;
    dersTitle = dersModel!.title;
    dersId = dersModel.id;
  }

  @override
  Widget build(BuildContext context) {
    log("DersID --> $dersId");
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
          const HatContainer(),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 16),
            child: SvgPicture.asset(
              'assets/icons/list_alt.svg',
            ),
          )
        ],
      ),
      body: const HarfGridView(),
    );
  }
}
