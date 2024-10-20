import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/widget/harf_container.dart';

import '../model/icerik_models/harf_icerik_model.dart';
import '../model/ornek_models/harf_ornek_model.dart';

class HarfGridView extends StatelessWidget {
  const HarfGridView({super.key, required this.harfIcerikModel});

  final HarfIcerikModel harfIcerikModel;

  @override
  Widget build(BuildContext context) {
    final List<HarfOrnekModel> ornekModelList = harfIcerikModel.ornek;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: ornekModelList.length,
          itemBuilder: (context, index) {
            final HarfOrnekModel ornek = ornekModelList[index];
            return HarfContainer(
              title: ornek.lat,
              icon: ornek.osm,
              isDottedBorder: ornek.hasDottedBorder,
              color: ornek.colors.contColor!,
              titleColor: ornek.colors.latColor!,
              iconColor: ornek.colors.osmColor!,
            );
          },
        ),
      ),
    );
  }
}
