abstract class LoggedTypeInfo {
  String? get uuid;
  String? get name;
  String? get describle;
  String? get isDrawName;
  String? get created;
  String? get updated;

  Map<String, dynamic> toMap();
  String toJson();
  LoggedTypeInfo copyWith({
    String? name,
    String? describle,
    String? isDrawName,
  });
}
