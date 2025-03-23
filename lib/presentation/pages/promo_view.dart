import 'package:flutter/material.dart';
import 'package:halaqat/presentation/pages/halaqat_page.dart';
import 'package:halaqat/presentation/pages/home_page.dart';
import 'package:halaqat/presentation/pages/student_page.dart';
import 'package:halaqat/presentation/state/index_nav_bar_state.dart';
import 'package:halaqat/presentation/widgets/promo_view/bottom_nav_bar.dart';
import 'package:halaqat/util/widgets/bg.dart';
import 'package:provider/provider.dart';

class PromoView extends StatefulWidget {
  const PromoView({super.key});

  @override
  State<PromoView> createState() => _PromoViewState();
}

class _PromoViewState extends State<PromoView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Bg(),
            Positioned.fill(
              child: SingleChildScrollView(
                child: IndexedStack(
                  index: context.watch<IndexNavBarState>().index,
                  children: [
                    StudentPage(),
                    HalaqatPage(),
                    HomePage(),
                    Center(child: Text("4")),
                    Center(child: Text("5")),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.only(bottom: 15), child: BottomNavBar()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
