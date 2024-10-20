import 'package:flutter_svg/flutter_svg.dart';
import 'package:hayrat_osmanlica_elif_ba/model/icerik_models/birlesim_icerik_model.dart';
import 'package:hayrat_osmanlica_elif_ba/model/icerik_models/harf_icerik_model.dart';
import 'package:hayrat_osmanlica_elif_ba/model/icerik_models/sayi_icerik_model.dart';
import 'package:hayrat_osmanlica_elif_ba/view/detail/widgets/app_bar.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hayrat_osmanlica_elif_ba/widget/birlesim_list_view.dart';

import '../../model/ders_model.dart';
import '../../widget/harf_grid_view.dart';
import '../../widget/sayi_list_view.dart';
import '../../widget/sonraki_ders_container.dart';
import 'widgets/link_container.dart';
import '../home/home_view.dart';
import 'detail_view_model.dart';

final DetailViewModel detailViewModel = DetailViewModel();

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.aktifDersModel});

  final DersModel aktifDersModel;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final Color primaryColor = homeViewModel.aktifKonuModel!.colors.primaryColor!;
  final Color secondaryColor = homeViewModel.aktifKonuModel!.colors.secondaryColor!;

  @override
  void initState() {
    super.initState();
    detailViewModel.init(widget.aktifDersModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverAppBar(
              floating: false,
              centerTitle: false,
              pinned: false,
              automaticallyImplyLeading: false,

              /// Todo --> Sbt yokseklik olmamali
              toolbarHeight: 210,
              stretch: true,
              titleSpacing: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            .copyWith(color: context.colorScheme().outline),
                      ),
                    ],
                  ),
                  const Gap(4),
                  Text(
                    detailViewModel.aktifDersModel!.title,
                    style: context.textTheme().titleLarge,
                    maxLines: 3,
                  ),
                  const Gap(16),
                  LinkContainer(color: primaryColor),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: detailViewModel.aktifDersModel!.icerikler!.length,
            itemBuilder: (context, index) {
              final model = detailViewModel.aktifDersModel!.icerikler![index];

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24, left: 24, bottom: 32),
                    child: Text(
                      model.konu.toString(),
                      style: context.textTheme().bodyMedium,
                    ),
                  ),
                  if (model is HarfIcerikModel)
                    Flexible(
                      child: HarfGridView(
                        harfIcerikModel: model,
                      ),
                    ),
                  if (model is SayiIcerikModel)
                    Flexible(
                      child: SayiListView(
                        sayiIcerikModel: model,
                      ),
                    ),
                  if (model is BirlesimIcerikModel)
                    Flexible(
                      child: BirlesimListView(birlesimIcerikModel: model),
                    )
                ],
              );
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SvgPicture.asset('assets/icons/line.svg'),
                const Gap(40),
                const SonrakiDersContainer(),
                const Gap(40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
