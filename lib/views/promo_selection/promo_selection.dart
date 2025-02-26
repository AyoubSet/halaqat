import 'package:flutter/material.dart';
import 'package:halaqat/services/promo_service.dart';
import 'package:halaqat/views/promo_selection/components/add_promo_button.dart';
import 'package:halaqat/views/promo_selection/components/list_tile_of_promo.dart';

//This is where the user choose the promo
class PromoSelectionView extends StatelessWidget {
  const PromoSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 50, 11),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (PromoService().promos.isEmpty)
                  Text(
                    'No Promo Found, Add New...',
                    style: TextStyle(color: Colors.white),
                  )
                else
                  SizedBox(
                    height: screenHeight * 0.8,
                    width: screenWidth * 0.9,
                    child: Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: PromoService().promos.length,
                        itemBuilder: (context, index) {
                          return ListTileOfPromo(
                            title: PromoService().promos[index].namePromo,
                            subtitle: PromoService().promos[index].description,
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: AddPromoButton(),
          ),
        ],
      ),
    );
  }
}
