import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';
import 'package:hayrat_osmanlica_elif_ba/model/icerik_models/sayi_icerik_model.dart';
import 'package:hayrat_osmanlica_elif_ba/theme/light_theme.dart';

import '../model/ornek_models/sayi_ornek_model.dart';
import '../theme/text_styles.dart';

class SayiListView extends StatelessWidget {
  const SayiListView({super.key, required this.sayiIcerikModel});

  final SayiIcerikModel sayiIcerikModel;

  @override
  Widget build(BuildContext context) {
    final List<List<SayiOrnekModel>> ornekList = sayiIcerikModel.ornek;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ornekList.length,
      itemBuilder: (context, index) {
        final List<SayiOrnekModel> satirOrnekleri = ornekList[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: _buildGrid(satirOrnekleri),
        );
      },
    );
  }

  Widget _buildGrid(List<SayiOrnekModel> ornekler) {
    int itemCount = ornekler.length;
    int crossAxisCount = 3;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final SayiOrnekModel ornek = ornekler[index];

        bool isLastRowSingleItem =
            (itemCount % crossAxisCount == 1) || (index == itemCount - 1);

        return GridTile(
          child: GridTile(
            child: SizedBox(
              width: isLastRowSingleItem ? double.infinity : null,
              child: SayiContainer(
                title: ornek.lat,
                icon: ornek.osm,
                isDottedBorder: ornek.hasDottedBorder,
                color: context.colorScheme().surface,
                titleColor: ornek.colors.latColor!,
                iconColor: ornek.colors.osmColor!,
              ),
            ),
          ),
        );
      },
    );
  }
}

class SayiContainer extends StatelessWidget {
  const SayiContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.isDottedBorder,
    required this.color,
    required this.titleColor,
    required this.iconColor,
  });

  final String title;
  final String icon;
  final bool isDottedBorder;
  final Color color;
  final Color titleColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: isDottedBorder ? titleColor : Colors.transparent,
      dashPattern: const [8, 5],
      borderType: BorderType.RRect,
      radius: const Radius.circular(8),
      child: Container(
        width: double.infinity,
        height: 101,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.textTheme().bodyLarge!.copyWith(color: titleColor),
            ),
            Text(
              icon,
              style: TextStyles.rikaKelimeler.copyWith(
                color: iconColor,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
