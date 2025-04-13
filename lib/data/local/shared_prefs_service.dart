import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:halaqat/data/models/promo_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static const String _promoKey = "selctedPromoKey";
  String get promoKey => _promoKey;
  Future<void> saveSelectedPromo(int promoID)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_promoKey, promoID);
  }
  Future<DataBasePromo?> getSelectedPromo()async{
    final prefs = await SharedPreferences.getInstance();
    return await PromoService().getPromoByID(id: prefs.getInt(_promoKey)!);
  }
    Future<void> clearSelectedPromo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_promoKey);
  }
}