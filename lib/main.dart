import 'package:flutter/material.dart';
import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:halaqat/data/local/shared_prefs_service.dart';
import 'package:halaqat/presentation/pages/promo_selection_view.dart';
import 'package:halaqat/presentation/pages/promo_view.dart';
import 'package:halaqat/presentation/pages/student_form_page.dart';
import 'package:halaqat/presentation/state/form_state.dart';
import 'package:halaqat/presentation/state/index_nav_bar_state.dart';
import 'package:halaqat/util/widgets/progress_indicator.dart';
import 'package:halaqat/util/constants/routes.dart';
import 'package:provider/provider.dart';

//TODO: Form of creating student


Future<void> loadSelectedPromo()async{
  final sharedPrefs = SharedPrefsService();
  final savedPromo = await sharedPrefs.getSelectedPromo();
  if (savedPromo != null) {
    PromoService().currentPromo = savedPromo;
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
        promoSelection : (context)=>PromoSelectionView1(),
        promo : (context)=>PromoView(),
        studentForm : (context)=>StudentFormPage()
      },
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: SharedPrefsService().getSelectedPromo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: PIndicator()); 
          } else {
            final promo = snapshot.data;
            if (promo != null) {
              PromoService().currentPromo = promo;
              return PromoView();
            } else {
              return PromoSelectionView1();
            }
          }
        },
      ),
    );
  }
}