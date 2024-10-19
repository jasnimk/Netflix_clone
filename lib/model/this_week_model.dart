import 'dart:convert';

class ThisWeekModel {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;
  bool userPlatforms;

  ThisWeekModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
    required this.userPlatforms,
  });

  ThisWeekModel copyWith({
    int? count,
    dynamic next,
    dynamic previous,
    List<Result>? results,
    bool? userPlatforms,
  }) =>
      ThisWeekModel(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
        userPlatforms: userPlatforms ?? this.userPlatforms,
      );

  factory ThisWeekModel.fromRawJson(String str) =>
      ThisWeekModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ThisWeekModel.fromJson(Map<String, dynamic> json) => ThisWeekModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        userPlatforms: json["user_platforms"] ?? false, // Provide default
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "user_platforms": userPlatforms,
      };
}

class Result {
  String slug;
  String name;
  int playtime;
  List<Platform> platforms;
  List<Store>? stores;
  DateTime released;
  bool tba;
  String backgroundImage;
  double rating;
  int ratingTop;
  List<Rating> ratings;
  int ratingsCount;
  int reviewsTextCount;
  int added;
  AddedByStatus? addedByStatus;
  dynamic metacritic;
  int suggestionsCount;
  DateTime updated;
  int id;
  dynamic score;
  dynamic clip;
  List<Tag> tags;
  dynamic esrbRating;
  dynamic userGame;
  int reviewsCount;
  String saturatedColor;
  String dominantColor;
  List<ShortScreenshot> shortScreenshots;
  List<Platform> parentPlatforms;
  List<Genre> genres;
  int? communityRating;

  Result({
    required this.slug,
    required this.name,
    required this.playtime,
    required this.platforms,
    this.stores,
    required this.released,
    required this.tba,
    required this.backgroundImage,
    required this.rating,
    required this.ratingTop,
    required this.ratings,
    required this.ratingsCount,
    required this.reviewsTextCount,
    required this.added,
    this.addedByStatus,
    this.metacritic,
    required this.suggestionsCount,
    required this.updated,
    required this.id,
    this.score,
    this.clip,
    required this.tags,
    this.esrbRating,
    this.userGame,
    required this.reviewsCount,
    required this.saturatedColor,
    required this.dominantColor,
    required this.shortScreenshots,
    required this.parentPlatforms,
    required this.genres,
    this.communityRating,
  });

  Result copyWith({
    String? slug,
    String? name,
    int? playtime,
    List<Platform>? platforms,
    List<Store>? stores,
    DateTime? released,
    bool? tba,
    String? backgroundImage,
    double? rating,
    int? ratingTop,
    List<Rating>? ratings,
    int? ratingsCount,
    int? reviewsTextCount,
    int? added,
    AddedByStatus? addedByStatus,
    dynamic metacritic,
    int? suggestionsCount,
    DateTime? updated,
    int? id,
    dynamic score,
    dynamic clip,
    List<Tag>? tags,
    dynamic esrbRating,
    dynamic userGame,
    int? reviewsCount,
    String? saturatedColor,
    String? dominantColor,
    List<ShortScreenshot>? shortScreenshots,
    List<Platform>? parentPlatforms,
    List<Genre>? genres,
    int? communityRating,
  }) =>
      Result(
        slug: slug ?? this.slug,
        name: name ?? this.name,
        playtime: playtime ?? this.playtime,
        platforms: platforms ?? this.platforms,
        stores: stores ?? this.stores,
        released: released ?? this.released,
        tba: tba ?? this.tba,
        backgroundImage: backgroundImage ?? this.backgroundImage,
        rating: rating ?? this.rating,
        ratingTop: ratingTop ?? this.ratingTop,
        ratings: ratings ?? this.ratings,
        ratingsCount: ratingsCount ?? this.ratingsCount,
        reviewsTextCount: reviewsTextCount ?? this.reviewsTextCount,
        added: added ?? this.added,
        addedByStatus: addedByStatus ?? this.addedByStatus,
        metacritic: metacritic ?? this.metacritic,
        suggestionsCount: suggestionsCount ?? this.suggestionsCount,
        updated: updated ?? this.updated,
        id: id ?? this.id,
        score: score ?? this.score,
        clip: clip ?? this.clip,
        tags: tags ?? this.tags,
        esrbRating: esrbRating ?? this.esrbRating,
        userGame: userGame ?? this.userGame,
        reviewsCount: reviewsCount ?? this.reviewsCount,
        saturatedColor: saturatedColor ?? this.saturatedColor,
        dominantColor: dominantColor ?? this.dominantColor,
        shortScreenshots: shortScreenshots ?? this.shortScreenshots,
        parentPlatforms: parentPlatforms ?? this.parentPlatforms,
        genres: genres ?? this.genres,
        communityRating: communityRating ?? this.communityRating,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        slug: json["slug"],
        name: json["name"],
        playtime: json["playtime"],
        platforms: List<Platform>.from(
            json["platforms"].map((x) => Platform.fromJson(x))),
        stores: json["stores"] == null
            ? null
            : List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        released: DateTime.parse(json["released"]),
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        addedByStatus: json["added_by_status"] == null
            ? null
            : AddedByStatus.fromJson(json["added_by_status"]),
        metacritic: json["metacritic"],
        suggestionsCount: json["suggestions_count"],
        updated: DateTime.parse(json["updated"]),
        id: json["id"],
        score: json["score"],
        clip: json["clip"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        esrbRating: json["esrb_rating"],
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        shortScreenshots: List<ShortScreenshot>.from(
            json["short_screenshots"].map((x) => ShortScreenshot.fromJson(x))),
        parentPlatforms: List<Platform>.from(
            json["parent_platforms"].map((x) => Platform.fromJson(x))),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        communityRating: json["community_rating"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "playtime": playtime,
        "platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
        "stores": stores == null
            ? null
            : List<dynamic>.from(stores!.map((x) => x.toJson())),
        "released":
            "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status":
            addedByStatus == null ? null : addedByStatus!.toJson(),
        "metacritic": metacritic,
        "suggestions_count": suggestionsCount,
        "updated": updated.toIso8601String(),
        "id": id,
        "score": score,
        "clip": clip,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "esrb_rating": esrbRating,
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "short_screenshots":
            List<dynamic>.from(shortScreenshots.map((x) => x.toJson())),
        "parent_platforms":
            List<dynamic>.from(parentPlatforms.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "community_rating": communityRating,
      };
}

// Add the rest of the models here like Platform, Store, Tag, etc.

class AddedByStatus {
  int? yet;
  int owned;
  int toplay;
  int? playing;

  AddedByStatus({
    this.yet,
    required this.owned,
    required this.toplay,
    this.playing,
  });

  AddedByStatus copyWith({
    int? yet,
    int? owned,
    int? toplay,
    int? playing,
  }) =>
      AddedByStatus(
        yet: yet ?? this.yet,
        owned: owned ?? this.owned,
        toplay: toplay ?? this.toplay,
        playing: playing ?? this.playing,
      );

  factory AddedByStatus.fromRawJson(String str) =>
      AddedByStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        toplay: json["toplay"],
        playing: json["playing"],
      );

  Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "toplay": toplay,
        "playing": playing,
      };
}

class Genre {
  int id;
  String name;
  String slug;

  Genre({
    required this.id,
    required this.name,
    required this.slug,
  });

  Genre copyWith({
    int? id,
    String? name,
    String? slug,
  }) =>
      Genre(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
      );

  factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Platform {
  Genre platform;

  Platform({
    required this.platform,
  });

  Platform copyWith({
    Genre? platform,
  }) =>
      Platform(
        platform: platform ?? this.platform,
      );

  factory Platform.fromRawJson(String str) =>
      Platform.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        platform: Genre.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
      };
}

class Rating {
  int id;
  String title;
  int count;
  double percent;

  Rating({
    required this.id,
    required this.title,
    required this.count,
    required this.percent,
  });

  Rating copyWith({
    int? id,
    String? title,
    int? count,
    double? percent,
  }) =>
      Rating(
        id: id ?? this.id,
        title: title ?? this.title,
        count: count ?? this.count,
        percent: percent ?? this.percent,
      );

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
      };
}

class ShortScreenshot {
  int id;
  String image;

  ShortScreenshot({
    required this.id,
    required this.image,
  });

  ShortScreenshot copyWith({
    int? id,
    String? image,
  }) =>
      ShortScreenshot(
        id: id ?? this.id,
        image: image ?? this.image,
      );

  factory ShortScreenshot.fromRawJson(String str) =>
      ShortScreenshot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) =>
      ShortScreenshot(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class Store {
  Genre store;

  Store({
    required this.store,
  });

  Store copyWith({
    Genre? store,
  }) =>
      Store(
        store: store ?? this.store,
      );

  factory Store.fromRawJson(String str) => Store.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        store: Genre.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "store": store.toJson(),
      };
}

class Tag {
  int id;
  String name;
  String slug;
  Language language;
  int gamesCount;
  String imageBackground;

  Tag({
    required this.id,
    required this.name,
    required this.slug,
    required this.language,
    required this.gamesCount,
    required this.imageBackground,
  });

  Tag copyWith({
    int? id,
    String? name,
    String? slug,
    Language? language,
    int? gamesCount,
    String? imageBackground,
  }) =>
      Tag(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        language: language ?? this.language,
        gamesCount: gamesCount ?? this.gamesCount,
        imageBackground: imageBackground ?? this.imageBackground,
      );

  factory Tag.fromRawJson(String str) => Tag.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        language: languageValues.map[json["language"]]!,
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "language": languageValues.reverse[language],
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}

enum Language { ENG }

final languageValues = EnumValues({"eng": Language.ENG});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
