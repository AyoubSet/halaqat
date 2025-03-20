import 'package:flutter/material.dart';
import 'package:halaqat/presentation/pages/promo_selection_view.dart';
import 'package:halaqat/presentation/state/form_state.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PromoFormState()),
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
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        child: PromoSelectionView1(),
      ),
    );
  }
}
