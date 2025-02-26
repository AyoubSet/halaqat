class Promo {
  final String namePromo;
  final String? descriptionPromo ;
  Promo({required this.namePromo,this.descriptionPromo});

  String get name => namePromo;
  String get description => descriptionPromo ?? '';
}