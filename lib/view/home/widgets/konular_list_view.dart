import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';
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
            padding: const EdgeInsets.only(left: 24),
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
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: aktifmi
                            ? konuModel.colors.primaryColor
                            : context.colorScheme().surfaceBright,
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
                              color: aktifmi
                                  ? context.colorScheme().scrim
                                  : context.colorScheme().onSurface,
                              fit: BoxFit.none,
                            );
                          }),
                          Text(
                            konuModel.title,
                            style: cotext.textTheme().headlineSmall?.copyWith(
                                  color: aktifmi
                                      ? context.colorScheme().scrim
                                      : context.colorScheme().outline,
                                  fontWeight: aktifmi ? FontWeight.w600 : FontWeight.w400,
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
