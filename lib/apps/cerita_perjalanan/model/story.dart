import 'dart:convert';

List<Story> storyFromJson(String str) => List<Story>.from(json.decode(str).map((x) => Story.fromJson(x)));

String storyToJson(List<Story> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Story {
    Story({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Story.fromJson(Map<String, dynamic> json) => Story(
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
        required this.name,
        required this.review,
    });

    String name;
    String review;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
    };
}
