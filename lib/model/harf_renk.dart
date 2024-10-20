class HarfRenk {
  final String harf;
  final String color;

  HarfRenk({required this.harf, required this.color});

  factory HarfRenk.fromJson(Map<String, dynamic> json) {
    return HarfRenk(
      harf: json['harf'] as String? ?? '',
      color: json['color'] as String? ?? '',
    );
  }
}
