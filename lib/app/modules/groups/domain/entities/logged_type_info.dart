abstract class LoggedTypeInfo {
  String? get uuid;
  String? get name;
  String? get description;
  bool? get isDrawName;
  String? get created;
  String? get updated;

  Map<String, dynamic> toMap();
  String toJson();
  LoggedTypeInfo copyWith({
    String? name,
    String? description,
    bool? isDrawName,
  });
}
