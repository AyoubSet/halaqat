import 'package:flutter/material.dart';
import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:halaqat/data/models/promo_db.dart';
import 'package:halaqat/presentation/widgets/promo_selection/add_promo_button.dart';
import 'package:halaqat/presentation/widgets/promo_selection/list_tile_of_promo.dart';

//TODO : Add comments here
//TODO : Deplace the Set State to ListTile
//FIXME : Use consts here

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
      backgroundColor: const Color.fromARGB(255, 18, 50, 11),
      body: FutureBuilder(
        future: _promoService.getAllPromos(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return StreamBuilder<Object>(
                  stream: _promoService.allPromos,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return GestureDetector(
                            onTap: () =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            child: Stack(children: [
                              Center(
                                  child: Text(
                                'Loading Promos...',
                                style: TextStyle(color: Colors.white),
                              )),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: AddPromoButton(),
                              ),
                            ]));
                      case ConnectionState.active:
                        final allNotes = snapshot.data as List<DataBasePromo>;
                        final Widget widgetToDisplay;
                        if (snapshot.hasData) {
                          if (allNotes.isNotEmpty) {
                            widgetToDisplay = Center(
                                child: SizedBox(
                              height: screenHeight * 0.7,
                              width: screenWidth * 0.9,
                              child: ListView.builder(
                                itemCount: allNotes.length,
                                itemBuilder: (context, index) {
                                  return ListTileOfPromo(
                                    title: allNotes.elementAt(index).name,
                                    subtitle:
                                        allNotes.elementAt(index).descrption,
                                    index: index,
                                  );
                                },
                              ),
                            ));
                          } else {
                            widgetToDisplay = Center(
                                child: Text(
                              'No Promo found,Add new....',
                              style: TextStyle(color: Colors.white),
                            ));
                          }
                        } else {
                          widgetToDisplay = Text(
                            'Error',
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        return Stack(children: [
                          widgetToDisplay,
                          Align(
                            alignment: Alignment.bottomRight,
                            child: AddPromoButton(),
                          ),
                        ]);
                      default:
                        return const CircularProgressIndicator();
                    }
                  });
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
