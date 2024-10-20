import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../model/harf_renk.dart';
import '../model/icerik_models/birlesim_icerik_model.dart';
import '../model/ornek_models/birlesim_ornek_model.dart';
import '../theme/text_styles.dart';

class BirlesimListView extends StatelessWidget {
  const BirlesimListView({super.key, required this.birlesimIcerikModel});

  final BirlesimIcerikModel birlesimIcerikModel;

  @override
  Widget build(BuildContext context) {
    final List<BirlesimOrnekModel> ornekList = birlesimIcerikModel.ornek;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: ornekList.length,
        itemBuilder: (context, index) {
          BirlesimOrnekModel ornek = ornekList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildRow(ornek, context),
          );
        },
      ),
    );
  }

  Widget _buildRow(BirlesimOrnekModel ornek, BuildContext context) {
    // birlesimContainer'ın varlığına ve harfList'in boş olup olmamasına göre flex değerlerini belirliyoruz
    bool hasBirlesimContainer =
        ornek.birlesimContainer != null && ornek.birlesimContainer!.harfList.isNotEmpty;

    int ornekFlex = hasBirlesimContainer ? 20 : 10;
    int okutucuFlex = 5;
    int birlesimFlex = hasBirlesimContainer ? 7 : 0;

    List<Widget> rowChildren = [
      Expanded(
        flex: ornekFlex,
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: ornek.colors.ornekContainerColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
            child: RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                children: _buildKelimeSpans(context, ornek),
                style: DefaultTextStyle.of(context).style,
              ),
            ),
          ),
        ),
      ),
      const Gap(10),
      Expanded(
        flex: okutucuFlex,
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: ornek.colors.okutucuContainerColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              ornek.okutucuContainer.harfList.join(" "),
              style: TextStyles.rikaKelimeler.copyWith(
                color: ornek.colors.okutucuHarfColor,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
    ];

    if (hasBirlesimContainer) {
      rowChildren.insert(
        1,
        Expanded(
          flex: birlesimFlex,
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            height: 65,
            decoration: BoxDecoration(
              color: ornek.colors.ornekContainerColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: RichText(
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  children: _buildBirlesimKelimeSpans(context, ornek),
                  style: DefaultTextStyle.of(context).style,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      children: rowChildren,
    );
  }

  List<InlineSpan> _buildKelimeSpans(BuildContext context, BirlesimOrnekModel ornek) {
    List<InlineSpan> kelimeSpans = [];

    for (int i = 0; i < ornek.ornekContainer.harfList.length; i++) {
      List<HarfRenk> kelimeHarfList = ornek.ornekContainer.harfList[i];

      // Harfleri işleyip birleştiriyoruz
      List<TextSpan> harfSpans = kelimeHarfList.map<TextSpan>((harfModel) {
        return TextSpan(
          text: harfModel.harf,
          style: TextStyles.rikaKelimeler.copyWith(
            color: ornek.colors.getColorByName(context, harfModel.color),
          ),
        );
      }).toList();

      // HarfSpans'ı kelimeSpans'a ekliyoruz
      kelimeSpans.add(TextSpan(children: harfSpans));

      // Eğer son kelime değilse, bir boşluk ekliyoruz
      if (i < ornek.ornekContainer.harfList.length - 1) {
        kelimeSpans.add(TextSpan(text: ' - ', style: TextStyles.rikaKelimeler));
      }
    }

    return kelimeSpans;
  }

  List<InlineSpan> _buildBirlesimKelimeSpans(
      BuildContext context, BirlesimOrnekModel ornek) {
    List<InlineSpan> harfSpans = ornek.birlesimContainer!.harfList.map((harfModel) {
      return TextSpan(
        text: harfModel.harf,
        style: TextStyles.rikaKelimeler.copyWith(
          color: ornek.colors.getColorByName(context, harfModel.color),
        ),
      );
    }).toList();

    return harfSpans;
  }
}
