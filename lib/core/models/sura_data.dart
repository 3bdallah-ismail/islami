class SuraData {
  String nameAr;
  String nameEn;
  String number;
  String verses;
  SuraData({
    required this.number,
    required this.nameEn,
    required this.nameAr,
    required this.verses,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuraData &&
          runtimeType == other.runtimeType &&
          nameAr == other.nameAr &&
          nameEn == other.nameEn &&
          number == other.number &&
          verses == other.verses;

  @override
  int get hashCode =>
      nameAr.hashCode ^ nameEn.hashCode ^ number.hashCode ^ verses.hashCode;
}
