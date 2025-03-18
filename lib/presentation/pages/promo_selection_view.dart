import 'package:flutter/material.dart';
import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:halaqat/presentation/widgets/promo_selection/functions/active_status_generator.dart';
import 'package:halaqat/presentation/widgets/promo_selection/waiting_status.dart';
import 'package:halaqat/util/widgets/bg.dart';
import 'package:halaqat/util/widgets/progress_indicator.dart';

//TODO : Add comments here
class PromoSelectionView1 extends StatefulWidget {
  const PromoSelectionView1({super.key});
  @override
  State<PromoSelectionView1> createState() => _PromoSelectionViewState1();
}

class _PromoSelectionViewState1 extends State<PromoSelectionView1> {
  late final PromoService _promoService;

  @override
  void initState() {
    _promoService = PromoService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          //* Bg Pattern
          const Bg(),
          //* The Selection Logic (Display Halaqat/Indicating messages)
          FutureBuilder(
            future: _promoService.getAllPromos(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return StreamBuilder<Object>(
                      stream: _promoService.allPromos,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const WaitingStatus();
                          case ConnectionState.active:
                            return activeStatusGenerator(
                                snapshot: snapshot,
                                screenHeight: screenHeight,
                                screenWidth: screenWidth);
                          default:
                            return const PIndicator();
                        }
                      });
                default:
                  return const PIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
