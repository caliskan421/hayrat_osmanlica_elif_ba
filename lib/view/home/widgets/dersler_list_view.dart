import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hayrat_osmanlica_elif_ba/service/dersler_service.dart';
import 'package:gap/gap.dart';
import 'package:hayrat_osmanlica_elif_ba/view/home/home_view_model.dart';

class DerslerListView extends StatelessWidget {
  final ViewModel _viewModel = ViewModel();

  DerslerListView({super.key});

  @override
  Widget build(BuildContext context) {
    _viewModel.fetchDersler(context);
    return Expanded(
      child: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: _viewModel.derslerList.length,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future:
                    DerslerService().fetchDersTitle(context, _viewModel.konuIndex, index),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            const Gap(10),
                            Expanded(
                              child: Text(
                                "${index + 1} ${_viewModel.derslerList[index]}",
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
