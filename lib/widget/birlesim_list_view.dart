import 'package:flutter/material.dart';

class BirlesimListView extends StatelessWidget {
  const BirlesimListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10, // Örnek olarak 10 satır
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Soldaki container
              Expanded(
                flex: 2, // 1 birim genişlik
                child: Container(
                  height: 70,
                  color: Colors.blue,
                  child: Center(child: Text('Sol ${index + 1}')),
                ),
              ),
              const SizedBox(width: 10), // İki container arasında boşluk
              // Sağdaki container
              Expanded(
                flex: 1, // 2 birim genişlik (sola göre 2 kat geniş)
                child: Container(
                  height: 100,
                  color: Colors.red,
                  child: Center(child: Text('Sağ ${index + 1}')),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
