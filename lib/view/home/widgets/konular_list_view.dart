import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../theme/light_theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../home_view_model.dart';

class KonularListView extends StatelessWidget {
  final ViewModel _viewModel = ViewModel();

  KonularListView({super.key});

  @override
  Widget build(BuildContext context) {
    _viewModel.fetchKonular(context);
    _viewModel.fetchKonuIconlar(context);
    return SizedBox(
      height: 106,
      child: Observer(
        builder: (_) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _viewModel.konularList.length,
          itemBuilder: (cotext, index) {
            log("AAAAAAAAAA --> " + _viewModel.iconList.length.toString());
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 106, maxWidth: 140),
                child: Container(
                  height: 106,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: index == 0 ? AppColors.primary : AppColors.surface,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /// Konu LOGO
                      SvgPicture.asset(
                        'assets/icons/${_viewModel.iconList[index]}.svg',
                        color: index == 0 ? AppColors.background : AppColors.onSurface,
                        fit: BoxFit.none,
                      ),

                      /// Konu TITLE
                      Text(
                        _viewModel.konularList[index],
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: index == 0 ? AppColors.background : AppColors.outline),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
