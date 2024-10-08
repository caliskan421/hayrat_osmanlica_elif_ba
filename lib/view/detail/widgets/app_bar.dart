import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../home/home_view.dart';
import 'hat_container.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  AppBarView({super.key});

  final Color primaryColor = homeViewModel.aktifKonuModel!.colors.primaryColor!;
  final Color secondaryColor = homeViewModel.aktifKonuModel!.colors.secondaryColor!;

  // AppBar'ın tercih edilen boyutunu belirle
  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Varsayılan AppBar yüksekliği

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(18),
        child: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: SvgPicture.asset(
            'assets/icons/arrow_back_ios.svg',
            height: 10,
            width: 10,
          ),
        ),
      ),
      actions: [
        HatContainer(
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 16),
          child: SvgPicture.asset(
            'assets/icons/list_alt.svg',
          ),
        )
      ],
    );
  }
}
