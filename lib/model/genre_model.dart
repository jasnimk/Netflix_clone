import 'dart:convert';

class GenreId {
    List<Genre> genres;

    GenreId({
        required this.genres,
    });

    GenreId copyWith({
        List<Genre>? genres,
    }) => 
        GenreId(
            genres: genres ?? this.genres,
        );

    factory GenreId.fromRawJson(String str) => GenreId.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GenreId.fromJson(Map<String, dynamic> json) => GenreId(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    };
}

class Genre {
    int id;
    String name;

    Genre({
        required this.id,
        required this.name,
    });

    Genre copyWith({
        int? id,
        String? name,
    }) => 
        Genre(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
