class Promo {
  //*Attributes
  final String namePromo;
  final String? descriptionPromo;

  //*Constructer
  Promo({required this.namePromo, this.descriptionPromo});
  String get name => namePromo;
  String get description => descriptionPromo ?? '';
}
