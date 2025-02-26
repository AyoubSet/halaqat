import 'package:flutter/material.dart';
import 'package:halaqat/state/form_state.dart';
import 'package:halaqat/views/promo_selection/promo_selection.dart';
import 'package:provider/provider.dart';
// Make sure this is correct

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PromoFormState()), // ✅ Correct Provider Setup
      ],
      child: const MyApp(), // ✅ MyApp should be here
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PromoSelectionView(), // ✅ Ensure this widget is correctly implemented
    );
  }
}
