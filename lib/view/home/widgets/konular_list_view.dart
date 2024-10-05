import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/light_theme.dart';
import '../home_view.dart';

class KonularListView extends StatelessWidget {
  const KonularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106,
      child: Observer(
        builder: (_) {
          final aktifModel = homeViewModel.aktifKonuModel;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeViewModel.konuList.length,
            itemBuilder: (cotext, index) {
              final konuModel = homeViewModel.konuList[index];

              bool aktifmi = aktifModel!.id == konuModel.id;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    homeViewModel.akitfKonuAta(index);
                    homeViewModel.aktifKonuId = index + 1;
                  },
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 106, maxWidth: 140),
                    child: Container(
                      height: 106,

                      /// Todo --> Kutu boyutlarını düzenle...
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: aktifmi
                            ? konuModel.colors.primaryColor
                            : AppColors.surfaceBright,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Observer(builder: (context) {
                            String icon = konuModel.matbuIcon;
                            final isRika = homeViewModel.isRika;

                            if (isRika) {
                              icon = konuModel.rikaIcon;
                            }

                            return SvgPicture.asset(
                              'assets/icons/$icon.svg',
                              // Todo --> change color with [Theme]...
                              color: aktifmi ? AppColors.background : AppColors.onSurface,
                              fit: BoxFit.none,
                            );
                          }),
                          Text(
                            konuModel.title,
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color:
                                      aktifmi ? AppColors.background : AppColors.outline,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
