import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/view/detail/detail_view.dart';
import 'package:hayrat_osmanlica_elif_ba/widget/harf_container.dart';

import '../model/ornek_model.dart';

class HarfGridView extends StatelessWidget {
  HarfGridView({
    super.key,
  });
  final List<OrnekModel> a = detailViewModel.aktifDersModel!.icerikler![0].ornek!;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // her satırdaki öğe sayısı
          mainAxisSpacing: 12, // satırlar arasındaki boşluk
          crossAxisSpacing: 12, // sütunlar arasındaki boşluk
        ),
        itemCount: a.length,
        itemBuilder: (context, index) {
          return HarfContainer(
            title: a[index].lat,
            icon: a[index].osm,
            isDottedBorder: false,
            color: a[index].colors.contColor!,
            titleColor: a[index].colors.latColor!,
            iconColor: a[index].colors.osmColor!,
          );
        },
      ),
    );
  }
}
