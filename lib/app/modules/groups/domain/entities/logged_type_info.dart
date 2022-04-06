abstract class LoggedTypeInfo {
  String? get id;
  String? get name;
  String? get description;
  String? get image;
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
