import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/main_model.dart';
import '../../../theme/light_theme.dart';

class KonularListView extends StatelessWidget {
  const KonularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (cotext, index) {
          return FutureBuilder(
            future: readJson(cotext, index),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 106, maxWidth: 140),
                    child: Container(
                      height: 106,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: index == 0 ? AppColors.primary : AppColors.surface,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/okutucu_harfler_rika.svg',
                            color:
                                index == 0 ? AppColors.background : AppColors.onSurface,
                            fit: BoxFit.none,
                          ),
                          Text(
                            snapshot.data.toString(),
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: index == 0
                                    ? AppColors.background
                                    : AppColors.outline),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        },
        itemCount: 5,
      ),
    );
  }

  Future<String> readJson(BuildContext context, int index) async {
    String value = await DefaultAssetBundle.of(context).loadString(
      'assets/json_model/json_model.json',
    );
    var jsonObject = jsonDecode(value);
    List<MainModel> list =
        (jsonObject as List).map((item) => MainModel.fromJson(item)).toList();

    return list[index].konu.toString();
  }
}
