import 'package:hayrat_osmanlica_elif_ba/view/detail/widgets/app_bar.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widget/harf_grid_view.dart';
import '../../theme/light_theme.dart';
import 'widgets/link_container.dart';
import '../home/home_view.dart';
import 'detail_view_model.dart';

final DetailViewModel detailViewModel = DetailViewModel();

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final Color primaryColor = homeViewModel.aktifKonuModel!.colors.primaryColor!;
  final Color secondaryColor = homeViewModel.aktifKonuModel!.colors.secondaryColor!;

  @override
  void initState() {
    super.initState();
    detailViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
            sliver: SliverAppBar(
              floating: false,
              centerTitle: false,
              pinned: false,
              automaticallyImplyLeading: false,
              toolbarHeight: 100,
              titleSpacing: 0,
              title: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Text(
                          "${homeViewModel.dersNo.toString()}.Ders",
                          style: context
                              .textTheme()
                              .labelMedium!
                              .copyWith(color: primaryColor),
                        ),
                      ),
                      const Gap(8),
                      Text(
                        homeViewModel.aktifKonuModel!.title,
                        style: context
                            .textTheme()
                            .headlineSmall!
                            .copyWith(color: AppColors.outline),
                      ),
                    ],
                  ),
                  const Gap(5),
                  Text(
                    detailViewModel.aktifDersModel!.title,
                    style: context.textTheme().titleLarge,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                LinkContainer(color: primaryColor),
                const Gap(10),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: homeViewModel.aktifDersModel!.icerikler!.length,
            itemBuilder: (context, index) {
              final model = homeViewModel.aktifDersModel!.icerikler![index];

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      model.konu.toString(),
                      style: context.textTheme().bodyMedium,
                    ),
                  ),
                  if (model.harfMi)
                    Flexible(
                      child: HarfGridView(incerikIndex: index),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
