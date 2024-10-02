import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../theme/light_theme.dart';
import '../home_view.dart';

class DerslerListView extends StatelessWidget {
  const DerslerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (_) {
          final konuModel = homeViewModel.aktifKonuModel;
          return ListView.builder(
            itemCount: konuModel?.dersler.length ?? 0,
            itemBuilder: (context, index) {
              final aktifModel = homeViewModel.aktifKonuModel;
              final dersModel = konuModel!.dersler[index];
              bool isActiveDers =
                  aktifModel!.dersler[index].id == homeViewModel.aktifDersId;
              return Column(
                children: [
                  Row(
                    children: [
                      const Gap(10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            homeViewModel.aktifDersAta(index);
                            context.pushNamed(
                              'detail',
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: isActiveDers
                                      ? konuModel.renkler.primaryColor
                                      : AppColors.background,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          color: isActiveDers
                                              ? AppColors.background
                                              : AppColors.onSurface,
                                        ),
                                  ),
                                ),
                              ),
                              const Gap(15),
                              Expanded(
                                child: Text(
                                  dersModel.dersAdi,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: isActiveDers
                                            ? konuModel.renkler.primaryColor
                                            : AppColors.onSurface,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(color: AppColors.outlineVariant),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
