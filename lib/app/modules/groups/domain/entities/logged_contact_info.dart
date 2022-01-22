abstract class LoggedContactInfo {
  String? get id;
  String? get name;
  String? get image;
  Map<String, dynamic> toMap();
  String toJson();
  LoggedContactInfo copyWith({
    String? id,
    String? name,
    String? image,
  });
}
