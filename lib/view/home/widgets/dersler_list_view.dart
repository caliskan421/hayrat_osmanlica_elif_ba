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
          final dersList = homeViewModel.aktifDersList;

          if (konuModel == null || dersList.isEmpty) {
            return const Center(child: Text("Ders bulunamadı")); // Boş liste kontrolü
          }

          return ListView.builder(
            itemCount: dersList.length,
            itemBuilder: (context, index) {
              final dersModel = dersList[index]; // aktifDersList'ten dersModel alıyoruz

              return Observer(builder: (context) {
                final bool isActiveDers = dersModel.id == homeViewModel.aktifDersId;

                return Column(
                  children: [
                    Row(
                      children: [
                        const Gap(10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              homeViewModel.aktifDersAta(index);
                              context.pushNamed('detail');
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: isActiveDers
                                        ? konuModel.color.color
                                        : AppColors.background,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
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
                                    dersModel.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          color: isActiveDers
                                              ? konuModel.color.color
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
              });
            },
          );
        },
      ),
    );
  }
}
