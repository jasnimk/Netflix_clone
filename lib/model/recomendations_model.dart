// import 'dart:convert';

// class RecommendationsModel {
//   int page;
//   List<Result> results;
//   int totalPages;
//   int totalResults;

//   RecommendationsModel({
//     required this.page,
//     required this.results,
//     required this.totalPages,
//     required this.totalResults,
//   });

//   RecommendationsModel copyWith({
//     int? page,
//     List<Result>? results,
//     int? totalPages,
//     int? totalResults,
//   }) =>
//       RecommendationsModel(
//         page: page ?? this.page,
//         results: results ?? this.results,
//         totalPages: totalPages ?? this.totalPages,
//         totalResults: totalResults ?? this.totalResults,
//       );

//   factory RecommendationsModel.fromRawJson(String str) =>
//       RecommendationsModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
//       RecommendationsModel(
//         page: json["page"],
//         results:
//             List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//         totalPages: json["total_pages"],
//         totalResults: json["total_results"],
//       );

//   Map<String, dynamic> toJson() => {
//         "page": page,
//         "results": List<dynamic>.from(results.map((x) => x.toJson())),
//         "total_pages": totalPages,
//         "total_results": totalResults,
//       };
// }

// class Result {
//   String backdropPath;
//   int id;
//   String title;
//   String originalTitle;
//   String overview;
//   String posterPath;
//   MediaType mediaType;
//   bool adult;
//   String originalLanguage;
//   List<int> genreIds;
//   double popularity;
//   DateTime releaseDate;
//   bool video;
//   double voteAverage;
//   int voteCount;

//   Result({
//     required this.backdropPath,
//     required this.id,
//     required this.title,
//     required this.originalTitle,
//     required this.overview,
//     required this.posterPath,
//     required this.mediaType,
//     required this.adult,
//     required this.originalLanguage,
//     required this.genreIds,
//     required this.popularity,
//     required this.releaseDate,
//     required this.video,
//     required this.voteAverage,
//     required this.voteCount,
//   });

//   Result copyWith({
//     String? backdropPath,
//     int? id,
//     String? title,
//     String? originalTitle,
//     String? overview,
//     String? posterPath,
//     MediaType? mediaType,
//     bool? adult,
//     String? originalLanguage,
//     List<int>? genreIds,
//     double? popularity,
//     DateTime? releaseDate,
//     bool? video,
//     double? voteAverage,
//     int? voteCount,
//   }) =>
//       Result(
//         backdropPath: backdropPath ?? this.backdropPath,
//         id: id ?? this.id,
//         title: title ?? this.title,
//         originalTitle: originalTitle ?? this.originalTitle,
//         overview: overview ?? this.overview,
//         posterPath: posterPath ?? this.posterPath,
//         mediaType: mediaType ?? this.mediaType,
//         adult: adult ?? this.adult,
//         originalLanguage: originalLanguage ?? this.originalLanguage,
//         genreIds: genreIds ?? this.genreIds,
//         popularity: popularity ?? this.popularity,
//         releaseDate: releaseDate ?? this.releaseDate,
//         video: video ?? this.video,
//         voteAverage: voteAverage ?? this.voteAverage,
//         voteCount: voteCount ?? this.voteCount,
//       );

//   factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         backdropPath: json["backdrop_path"],
//         id: json["id"],
//         title: json["title"],
//         originalTitle: json["original_title"],
//         overview: json["overview"],
//         posterPath: json["poster_path"],
//         mediaType: mediaTypeValues.map[json["media_type"]]!,
//         adult: json["adult"],
//         originalLanguage: json["original_language"],
//         genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//         popularity: json["popularity"]?.toDouble(),
//         releaseDate: DateTime.parse(json["release_date"]),
//         video: json["video"],
//         voteAverage: json["vote_average"]?.toDouble(),
//         voteCount: json["vote_count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "backdrop_path": backdropPath,
//         "id": id,
//         "title": title,
//         "original_title": originalTitle,
//         "overview": overview,
//         "poster_path": posterPath,
//         "media_type": mediaTypeValues.reverse[mediaType],
//         "adult": adult,
//         "original_language": originalLanguage,
//         "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
//         "popularity": popularity,
//         "release_date":
//             "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
//         "video": video,
//         "vote_average": voteAverage,
//         "vote_count": voteCount,
//       };
// }

// enum MediaType { MOVIE }

// final mediaTypeValues = EnumValues({"movie": MediaType.MOVIE});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
import 'dart:convert';

class RecommendationsModel {
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  RecommendationsModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  RecommendationsModel copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      RecommendationsModel(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory RecommendationsModel.fromRawJson(String str) =>
      RecommendationsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(
        page: json["page"] as int,
        results: List<Result>.from(
            (json["results"] as List).map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"] as int,
        totalResults: json["total_results"] as int,
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  final String? backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? posterPath;
  final MediaType mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final DateTime releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Result({
    this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Result copyWith({
    String? backdropPath,
    int? id,
    String? title,
    String? originalTitle,
    String? overview,
    String? posterPath,
    MediaType? mediaType,
    bool? adult,
    String? originalLanguage,
    List<int>? genreIds,
    double? popularity,
    DateTime? releaseDate,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      Result(
        backdropPath: backdropPath ?? this.backdropPath,
        id: id ?? this.id,
        title: title ?? this.title,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        mediaType: mediaType ?? this.mediaType,
        adult: adult ?? this.adult,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        genreIds: genreIds ?? this.genreIds,
        popularity: popularity ?? this.popularity,
        releaseDate: releaseDate ?? this.releaseDate,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"] as String?,
        id: json["id"] as int,
        title: json["title"] as String,
        originalTitle: json["original_title"] as String,
        overview: json["overview"] as String,
        posterPath: json["poster_path"] as String?,
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        adult: json["adult"] as bool,
        originalLanguage: json["original_language"] as String,
        genreIds: List<int>.from(json["genre_ids"].map((x) => x as int)),
        popularity: (json["popularity"] as num).toDouble(),
        releaseDate: DateTime.parse(json["release_date"] as String),
        video: json["video"] as bool,
        voteAverage: (json["vote_average"] as num).toDouble(),
        voteCount: json["vote_count"] as int,
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType],
        "adult": adult,
        "original_language": originalLanguage,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

enum MediaType { movie }

final mediaTypeValues = EnumValues({"movie": MediaType.movie});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
