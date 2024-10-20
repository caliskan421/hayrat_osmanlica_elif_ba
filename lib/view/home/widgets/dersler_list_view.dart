import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';

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

                return Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Gap(10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await homeViewModel.aktifDersAta(index);
                                homeViewModel.dersNo = index + 1;
                                context.pushNamed(
                                  'detail',
                                  extra: homeViewModel.aktifDersModel,
                                );
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: isActiveDers
                                          ? konuModel.colors.primaryColor
                                          : context.colorScheme().scrim,
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
                                                  ? context.colorScheme().scrim
                                                  : context.colorScheme().onSurface,
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
                                                ? konuModel.colors.primaryColor
                                                : context.colorScheme().onSurface,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          color: context.colorScheme().outlineVariant,
                        ),
                      ),
                    ],
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }
}
