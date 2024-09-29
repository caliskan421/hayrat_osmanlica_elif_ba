import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../theme/light_theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../home_view_model.dart';

class KonularListView extends StatefulWidget {
  const KonularListView({super.key});

  @override
  State<KonularListView> createState() => _KonularListViewState();
}

class _KonularListViewState extends State<KonularListView> {
  final ViewModel _viewModel = ViewModel();

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
            log(_viewModel.iconList[index].toString());
            log('O->KONU Kist length ${_viewModel.konularList.length.toString()}');
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () {
                  /// Todo --> Bastan build edilme sirasinda basa donuyor ve kisa suerlik gidip geliyor...
                  _viewModel.konuIndex = index;
                  setState(() {});
                  log('S->KONU Kist length ${_viewModel.konularList.length.toString()}');
                },
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 106, maxWidth: 140),
                  child: Container(
                    height: 106,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: index == _viewModel.konuIndex
                          ? AppColors.primary
                          : AppColors.surface,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/${_viewModel.iconList[index]}.svg',

                          /// Todo --> change color with [Theme]...
                          ///theme: SvgTheme(currentColor: index == 0 ? AppColors.background : AppColors.onSurface),

                          color: index == _viewModel.konuIndex

                              /// todo --> Color Json'dan cekilecek...
                              ? AppColors.background
                              : AppColors.onSurface,
                          fit: BoxFit.none,
                        ),
                        Text(
                          _viewModel.konularList[index],
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: index == _viewModel.konuIndex
                                  ? AppColors.background
                                  : AppColors.outline),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
