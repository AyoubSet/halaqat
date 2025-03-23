import 'package:flutter/material.dart';
import 'package:halaqat/data/data_source/promos_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "${PromoService().currentPromo!.name} Promo",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                PromoService().currentPromo!.descrption,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )),
          (PromoService().currentPromo!.descrption != ""
              ? Padding(padding: EdgeInsets.all(5))
              : Padding(padding: EdgeInsets.all(0))),
          Container(
            margin: EdgeInsets.all(15),
            height: 170,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  height: 50,
                  width: 50,
                  child: Center(child: Text("Top 3ard")),
                ),
                Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  height: 50,
                  width: 50,
                  child: Center(child: Text("Top Presence")),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            color: const Color.fromARGB(255, 255, 255, 255),
            height: 200,
            child: Center(child: Text("Next Halqa")),
          ),
        ],
      ),
    );
  }
}
