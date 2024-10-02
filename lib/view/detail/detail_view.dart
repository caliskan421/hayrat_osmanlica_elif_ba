import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/ders_model.dart';
import '../home/home_view.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  String dersTitle = '';

  @override
  void initState() {
    super.initState();
    DersModel? dersModel = homeViewModel.aktifDers;
    dersTitle = dersModel!.dersAdi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SvgPicture.asset(
            'assets/icons/arrow_back_ios.svg',
            width: 14,
          ),
        ),
      ),
    );
  }
}
