import 'dart:convert';
import 'dart:typed_data';

enum AndroidAccountType { facebook, google, whatsapp, other }

class ContactModel {
  final String? identifier;
  final String? displayName;
  final String? givenName;
  final String? middleName;
  final String? prefix;
  final String? suffix;
  final String? familyName;
  final String? company;
  final String? jobTitle;
  final String? androidAccountTypeRaw;
  final String? androidAccountName;
  final AndroidAccountType? androidAccountType;
  List<Item>? emails = [];
  List<Item>? phones = [];
  Uint8List? avatar;
  DateTime? birthday;

  ContactModel({
    this.identifier,
    this.displayName,
    this.givenName,
    this.middleName,
    this.prefix,
    this.suffix,
    this.familyName,
    this.company,
    this.jobTitle,
    this.emails,
    this.phones,
    this.avatar,
    this.birthday,
    this.androidAccountType,
    this.androidAccountTypeRaw,
    this.androidAccountName,
  });
}

class Item {
  Item({
    this.label,
    this.value,
  });

  final String? label;
  final String? value;

  Item copyWith({
    String? label,
    String? value,
  }) {
    return Item(
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      label: map['label'] as String?,
      value: map['value'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Item(label: $label, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item && other.label == label && other.value == value;
  }

  @override
  int get hashCode => label.hashCode ^ value.hashCode;
}
