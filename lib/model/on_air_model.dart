import 'dart:convert';

class OnAirModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  OnAirModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  OnAirModel copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      OnAirModel(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory OnAirModel.fromRawJson(String str) =>
      OnAirModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OnAirModel.fromJson(Map<String, dynamic> json) => OnAirModel(
        page: json["page"] ?? 0,
        results: List<Result>.from(
            json["results"]?.map((x) => Result.fromJson(x)) ?? []),
        totalPages: json["total_pages"] ?? 0,
        totalResults: json["total_results"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String? posterPath;
  DateTime? firstAirDate;
  String name;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  Result copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? firstAirDate,
    String? name,
    double? voteAverage,
    int? voteCount,
  }) =>
      Result(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        originCountry: originCountry ?? this.originCountry,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalName: originalName ?? this.originalName,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        firstAirDate: firstAirDate ?? this.firstAirDate,
        name: name ?? this.name,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"]?.map((x) => x) ?? []),
        id: json["id"] ?? 0,
        originCountry:
            List<String>.from(json["origin_country"]?.map((x) => x) ?? []),
        originalLanguage: json["original_language"] ?? "",
        originalName: json["original_name"] ?? "",
        overview: json["overview"] ?? "",
        popularity: (json["popularity"] ?? 0).toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"] != null
            ? DateTime.tryParse(json["first_air_date"])
            : null,
        name: json["name"] ?? "",
        voteAverage: (json["vote_average"] ?? 0).toDouble(),
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date": firstAirDate?.toIso8601String(),
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
