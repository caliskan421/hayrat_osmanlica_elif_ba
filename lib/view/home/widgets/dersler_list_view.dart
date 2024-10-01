import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hayrat_osmanlica_elif_ba/theme/light_theme.dart';
import 'package:hayrat_osmanlica_elif_ba/view/home/home_view.dart';

class DerslerListView extends StatelessWidget {
  const DerslerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (_) {
          final konuModel = homeViewModel.aktifModel;
          return ListView.builder(
            itemCount: konuModel?.dersler.length ?? 0,
            itemBuilder: (context, index) {
              final aktifModel = homeViewModel.aktifModel;
              bool aktifMi = aktifModel!.id == 1;
              final dersModel = konuModel!.dersler[index];

              return Column(
                children: [
                  Row(
                    children: [
                      const Gap(10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed('detail');
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: aktifMi
                                      ? konuModel.renkler.primaryColor
                                      : AppColors.background,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Center(
                                  child: Text(
                                    "${index + 1} ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          color: aktifMi
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
                                        color: aktifMi
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
                    child: Divider(),
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
