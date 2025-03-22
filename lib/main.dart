import 'package:flutter/material.dart';
import 'package:halaqat/presentation/pages/promo_selection_view.dart';
import 'package:halaqat/presentation/pages/promo_view.dart';
import 'package:halaqat/presentation/state/form_state.dart';
import 'package:halaqat/presentation/state/index_nav_bar_state.dart';
import 'package:halaqat/util/constants/routes.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PromoFormState()),
        ChangeNotifierProvider(create: (_) => IndexNavBarState()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        promoSelection : (context)=> PromoSelectionView1(),
        promo : (context) => PromoView()
      },
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        child: PromoSelectionView1(),
      ),
    );
  }
}
