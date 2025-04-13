// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:halaqat/data/local/shared_prefs_service.dart';
import 'package:halaqat/presentation/state/index_nav_bar_state.dart';
import 'package:halaqat/util/constants/routes.dart';
import 'package:provider/provider.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          await SharedPrefsService().clearSelectedPromo();
          PromoService().currentPromo == null;
          context.read<IndexNavBarState>().updateIndex(2);
          Navigator.pushNamedAndRemoveUntil(
              context, promoSelection, (route) => false);
        },
        child: Text("Exit"));
  }
}
