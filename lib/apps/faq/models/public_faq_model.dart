// To parse this JSON data, do
//
//     final publicFaq = publicFaqFromJson(jsonString);

import 'dart:convert';

List<PublicFaq> publicFaqFromJson(String str) =>
    List<PublicFaq>.from(json.decode(str).map((x) => PublicFaq.fromJson(x)));

String publicFaqToJson(List<PublicFaq> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PublicFaq {
  PublicFaq({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory PublicFaq.fromJson(Map<String, dynamic> json) => PublicFaq(
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
    required this.question,
    required this.answer,
  });

  String question;
  String answer;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}
