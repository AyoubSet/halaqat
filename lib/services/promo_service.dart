import 'package:halaqat/entity/promo.dart';

class PromoService {
  static final PromoService _instance = PromoService._internal();

  PromoService._internal();

  factory PromoService() => _instance;

  List<Promo> _promos =[];
  List<Promo> get promos => _promos;

}