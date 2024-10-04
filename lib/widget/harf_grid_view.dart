import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/widget/harf_container.dart';

class HarfGridView extends StatelessWidget {
  const HarfGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // her satırdaki öğe sayısı
        mainAxisSpacing: 12, // satırlar arasındaki boşluk
        crossAxisSpacing: 12, // sütunlar arasındaki boşluk
      ),
      itemBuilder: (context, index) {
        return const HarfContainer(
          title: "Title",
          icon: "icon",
          isDottedBorder: false,
          color: Colors.red,
          titleColor: Colors.white,
          iconColor: Colors.white,
        );
      },
    );
  }
}
