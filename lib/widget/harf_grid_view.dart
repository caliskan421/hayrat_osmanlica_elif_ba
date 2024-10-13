import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/view/detail/detail_view.dart';
import 'package:hayrat_osmanlica_elif_ba/widget/harf_container.dart';

import '../model/ornek_models/harf_ornek_model.dart';

class HarfGridView extends StatelessWidget {
  const HarfGridView({super.key, required this.incerikIndex});

  final int incerikIndex;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> ornekModelList =
        detailViewModel.aktifDersModel!.icerikler![incerikIndex].ornek!;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Her satırdaki öğe sayısı
            mainAxisSpacing: 12, // Satırlar arasındaki boşluk
            crossAxisSpacing: 12, // Sütunlar arasındaki boşluk
            childAspectRatio: 1, // Her bir öğenin en-boy oranı
          ),
          itemCount: ornekModelList.length,
          itemBuilder: (context, index) {
            return HarfContainer(
              title: ornekModelList[index].lat,
              icon: ornekModelList[index].osm,
              isDottedBorder: ornekModelList[index].hasDottedBorder,
              color: ornekModelList[index].colors.contColor!,
              titleColor: ornekModelList[index].colors.latColor!,
              iconColor: ornekModelList[index].colors.osmColor!,
            );
          },
        ),
      ),
    );
  }
}
