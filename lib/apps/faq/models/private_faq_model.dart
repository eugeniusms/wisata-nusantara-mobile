// To parse this JSON data, do
//
//     final privateFaq = privateFaqFromJson(jsonString);

import 'dart:convert';

List<PrivateFaq> privateFaqFromJson(String str) =>
    List<PrivateFaq>.from(json.decode(str).map((x) => PrivateFaq.fromJson(x)));

String privateFaqToJson(List<PrivateFaq> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrivateFaq {
  PrivateFaq({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory PrivateFaq.fromJson(Map<String, dynamic> json) => PrivateFaq(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.user,
    required this.username,
    required this.question,
  });

  int user;
  String username;
  String question;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        username: json["username"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "username": username,
        "question": question,
      };
}
