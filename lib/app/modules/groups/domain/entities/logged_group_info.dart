abstract class LoggedGroupInfo {
  String? get uuid;
  Object? get type;
  String? get name;
  String? get describle;
  String? get date;
  String? get priceMin;
  String? get priceMax;
  String? get created;
  String? get updated;

  Map<String, dynamic> toMap();
  String toJson();
  LoggedGroupInfo copyWith({
    Object? type,
    String? name,
    String? describle,
    String? date,
    String? priceMin,
    String? priceMax,
  });
}
