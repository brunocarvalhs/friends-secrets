abstract class LoggedTypeInfo {
  String? get uuid;
  String? get name;
  String? get describle;
  bool? get isDrawName;
  String? get created;
  String? get updated;

  Map<String, dynamic> toMap();
  String toJson();
  LoggedTypeInfo copyWith({
    String? name,
    String? describle,
    bool? isDrawName,
  });
}
