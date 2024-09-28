import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hayrat_osmanlica_elif_ba/service/dersler_service.dart';
import 'package:gap/gap.dart';
import 'package:hayrat_osmanlica_elif_ba/view/home/home_view_model.dart';

class DerslerListView extends StatelessWidget {
  final ViewModel konuViewModel = ViewModel();

  DerslerListView({super.key});

  @override
  Widget build(BuildContext context) {
    konuViewModel.fetchDersler(context);
    return Expanded(
      child: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: konuViewModel.derslerList.length, // Ders listesi boyutunu kullan
            itemBuilder: (context, index) {
              return FutureBuilder(
                /// TODO --> {0} degeri [GestureDetector]'den gelecek...
                future: DerslerService().fetchDersTitle(context, 0, index),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            const Gap(10),
                            Expanded(
                              child: Text(
                                "${index + 1} ${konuViewModel.derslerList[index]}",
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(),
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
