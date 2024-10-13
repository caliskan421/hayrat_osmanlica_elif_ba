import 'package:flutter/material.dart';
import 'harf_grid_view.dart'; // HarfGridView'i ekliyoruz

class SayiListView extends StatelessWidget {
  const SayiListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Kendi kaydırması olmayacak
      itemCount: 3, // 3 eleman olacak
      itemBuilder: (context, index) {
        // Her bir eleman için HarfGridView döndürüyoruz
        return HarfGridView(incerikIndex: index);
      },
    );
  }
}
