import 'dart:convert';

class GameModel {
  final int count;
  final String? next;
  final dynamic previous;
  final List<Result> results;
  final String seoTitle;
  final String seoDescription;
  final String seoKeywords;
  final String seoH1;
  final bool noindex;
  final bool nofollow;
  final String description;
  final Filters filters;
  final List<String> nofollowCollections;

  GameModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
    required this.seoTitle,
    required this.seoDescription,
    required this.seoKeywords,
    required this.seoH1,
    required this.noindex,
    required this.nofollow,
    required this.description,
    required this.filters,
    required this.nofollowCollections,
  });

  factory GameModel.fromRawJson(String str) =>
      GameModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        count: json["count"] ?? 0,
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(
            (json["results"] ?? []).map((x) => Result.fromJson(x))),
        seoTitle: json["seo_title"] ?? '',
        seoDescription: json["seo_description"] ?? '',
        seoKeywords: json["seo_keywords"] ?? '',
        seoH1: json["seo_h1"] ?? '',
        noindex: json["noindex"] ?? false,
        nofollow: json["nofollow"] ?? false,
        description: json["description"] ?? '',
        filters: Filters.fromJson(json["filters"] ?? {}),
        nofollowCollections:
            List<String>.from(json["nofollow_collections"] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "seo_title": seoTitle,
        "seo_description": seoDescription,
        "seo_keywords": seoKeywords,
        "seo_h1": seoH1,
        "noindex": noindex,
        "nofollow": nofollow,
        "description": description,
        "filters": filters.toJson(),
        "nofollow_collections":
            List<dynamic>.from(nofollowCollections.map((x) => x)),
      };
}

class Filters {
  final List<FiltersYear> years;

  Filters({
    required this.years,
  });

  factory Filters.fromRawJson(String str) => Filters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        years: List<FiltersYear>.from(
            (json["years"] ?? []).map((x) => FiltersYear.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "years": List<dynamic>.from(years.map((x) => x.toJson())),
      };
}

class FiltersYear {
  final int from;
  final int to;
  final String filter;
  final int decade;
  final List<YearYear> years;
  final bool nofollow;
  final int count;

  FiltersYear({
    required this.from,
    required this.to,
    required this.filter,
    required this.decade,
    required this.years,
    required this.nofollow,
    required this.count,
  });

  factory FiltersYear.fromRawJson(String str) =>
      FiltersYear.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FiltersYear.fromJson(Map<String, dynamic> json) => FiltersYear(
        from: json["from"] ?? 0,
        to: json["to"] ?? 0,
        filter: json["filter"] ?? '',
        decade: json["decade"] ?? 0,
        years: List<YearYear>.from(
            (json["years"] ?? []).map((x) => YearYear.fromJson(x))),
        nofollow: json["nofollow"] ?? false,
        count: json["count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "filter": filter,
        "decade": decade,
        "years": List<dynamic>.from(years.map((x) => x.toJson())),
        "nofollow": nofollow,
        "count": count,
      };
}

class YearYear {
  final int year;
  final int count;
  final bool nofollow;

  YearYear({
    required this.year,
    required this.count,
    required this.nofollow,
  });

  factory YearYear.fromRawJson(String str) =>
      YearYear.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YearYear.fromJson(Map<String, dynamic> json) => YearYear(
        year: json["year"] ?? 0,
        count: json["count"] ?? 0,
        nofollow: json["nofollow"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "count": count,
        "nofollow": nofollow,
      };
}

class Result {
  final int id;
  final String slug;
  final String name;
  final DateTime? released;
  final bool tba;
  final String? backgroundImage;
  final double rating;
  final int ratingTop;
  final List<Rating> ratings;
  final int ratingsCount;
  final int reviewsTextCount;
  final int added;
  final AddedByStatus addedByStatus;
  final int? metacritic;
  final int playtime;
  final int suggestionsCount;
  final DateTime updated;
  final dynamic userGame;
  final int reviewsCount;
  final String saturatedColor;
  final String dominantColor;
  final List<PlatformElement> platforms;
  final List<ParentPlatform> parentPlatforms;
  final List<Genre> genres;
  final List<Store> stores;
  final dynamic clip;
  final List<Genre> tags;
  final EsrbRating? esrbRating;
  final List<ShortScreenshot> shortScreenshots;
  final String? imageBackground;

  Result({
    required this.id,
    required this.slug,
    required this.name,
    this.released,
    required this.tba,
    this.backgroundImage,
    this.imageBackground,
    required this.rating,
    required this.ratingTop,
    required this.ratings,
    required this.ratingsCount,
    required this.reviewsTextCount,
    required this.added,
    required this.addedByStatus,
    this.metacritic,
    required this.playtime,
    required this.suggestionsCount,
    required this.updated,
    this.userGame,
    required this.reviewsCount,
    required this.saturatedColor,
    required this.dominantColor,
    required this.platforms,
    required this.parentPlatforms,
    required this.genres,
    required this.stores,
    this.clip,
    required this.tags,
    this.esrbRating,
    required this.shortScreenshots,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] ?? 0,
        slug: json["slug"] ?? '',
        name: json["name"] ?? '',
        released: json["released"] == null
            ? null
            : DateTime.tryParse(json["released"]),
        tba: json["tba"] ?? false,
        backgroundImage: json["background_image"],
        imageBackground: json["image_background"],
        rating: (json["rating"] ?? 0).toDouble(),
        ratingTop: json["rating_top"] ?? 0,
        ratings: List<Rating>.from(
            (json["ratings"] ?? []).map((x) => Rating.fromJson(x))),
        ratingsCount: json["ratings_count"] ?? 0,
        reviewsTextCount: json["reviews_text_count"] ?? 0,
        added: json["added"] ?? 0,
        addedByStatus: AddedByStatus.fromJson(json["added_by_status"] ?? {}),
        metacritic: json["metacritic"],
        playtime: json["playtime"] ?? 0,
        suggestionsCount: json["suggestions_count"] ?? 0,
        updated:
            DateTime.parse(json["updated"] ?? DateTime.now().toIso8601String()),
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"] ?? 0,
        saturatedColor: json["saturated_color"] ?? '',
        dominantColor: json["dominant_color"] ?? '',
        platforms: List<PlatformElement>.from(
            (json["platforms"] ?? []).map((x) => PlatformElement.fromJson(x))),
        parentPlatforms: List<ParentPlatform>.from(
            (json["parent_platforms"] ?? [])
                .map((x) => ParentPlatform.fromJson(x))),
        genres: List<Genre>.from(
            (json["genres"] ?? []).map((x) => Genre.fromJson(x))),
        stores: List<Store>.from(
            (json["stores"] ?? []).map((x) => Store.fromJson(x))),
        clip: json["clip"],
        tags: List<Genre>.from(
            (json["tags"] ?? []).map((x) => Genre.fromJson(x))),
        esrbRating: json["esrb_rating"] == null
            ? null
            : EsrbRating.fromJson(json["esrb_rating"]),
        shortScreenshots: List<ShortScreenshot>.from(
            (json["short_screenshots"] ?? [])
                .map((x) => ShortScreenshot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "released": released?.toIso8601String(),
        "tba": tba,
        "background_image": backgroundImage,
        "image_background": imageBackground,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status": addedByStatus.toJson(),
        "metacritic": metacritic,
        "playtime": playtime,
        "suggestions_count": suggestionsCount,
        "updated": updated.toIso8601String(),
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
        "parent_platforms":
            List<dynamic>.from(parentPlatforms.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
        "clip": clip,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "esrb_rating": esrbRating?.toJson(),
        "short_screenshots":
            List<dynamic>.from(shortScreenshots.map((x) => x.toJson())),
      };
}

class AddedByStatus {
  final int yet;
  final int owned;
  final int beaten;
  final int toplay;
  final int dropped;
  final int playing;

  AddedByStatus({
    required this.yet,
    required this.owned,
    required this.beaten,
    required this.toplay,
    required this.dropped,
    required this.playing,
  });

  factory AddedByStatus.fromRawJson(String str) =>
      AddedByStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"] ?? 0,
        owned: json["owned"] ?? 0,
        beaten: json["beaten"] ?? 0,
        toplay: json["toplay"] ?? 0,
        dropped: json["dropped"] ?? 0,
        playing: json["playing"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
      };
}

class EsrbRating {
  final int id;
  final String name;
  final String slug;

  EsrbRating({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory EsrbRating.fromRawJson(String str) =>
      EsrbRating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EsrbRating.fromJson(Map<String, dynamic> json) => EsrbRating(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        slug: json["slug"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Genre {
  final int id;
  final String name;
  final String slug;
  final int gamesCount;
  final String imageBackground;
  final String? domain;
  final String? language;

  Genre({
    required this.id,
    required this.name,
    required this.slug,
    required this.gamesCount,
    required this.imageBackground,
    this.domain,
    this.language,
  });

  factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        slug: json["slug"] ?? '',
        gamesCount: json["games_count"] ?? 0,
        imageBackground: json["image_background"] ?? '',
        domain: json["domain"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domain,
        "language": language,
      };
}

class ParentPlatform {
  final EsrbRating platform;

  ParentPlatform({
    required this.platform,
  });

  factory ParentPlatform.fromRawJson(String str) =>
      ParentPlatform.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: EsrbRating.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
      };
}

class PlatformElement {
  PlatformPlatform platform;
  DateTime releasedAt;
  Requirements? requirementsEn;
  Requirements? requirementsRu;

  PlatformElement({
    required this.platform,
    required this.releasedAt,
    required this.requirementsEn,
    required this.requirementsRu,
  });

  PlatformElement copyWith({
    PlatformPlatform? platform,
    DateTime? releasedAt,
    Requirements? requirementsEn,
    Requirements? requirementsRu,
  }) =>
      PlatformElement(
        platform: platform ?? this.platform,
        releasedAt: releasedAt ?? this.releasedAt,
        requirementsEn: requirementsEn ?? this.requirementsEn,
        requirementsRu: requirementsRu ?? this.requirementsRu,
      );

  factory PlatformElement.fromRawJson(String str) =>
      PlatformElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      PlatformElement(
        platform: PlatformPlatform.fromJson(json["platform"]),
        releasedAt: DateTime.parse(json["released_at"]),
        requirementsEn: json["requirements_en"] == null
            ? null
            : Requirements.fromJson(json["requirements_en"]),
        requirementsRu: json["requirements_ru"] == null
            ? null
            : Requirements.fromJson(json["requirements_ru"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
        "released_at":
            "${releasedAt.year.toString().padLeft(4, '0')}-${releasedAt.month.toString().padLeft(2, '0')}-${releasedAt.day.toString().padLeft(2, '0')}",
        "requirements_en": requirementsEn?.toJson(),
        "requirements_ru": requirementsRu?.toJson(),
      };
}

class PlatformPlatform {
  int id;
  String name;
  String slug;
  dynamic image;
  dynamic yearEnd;
  int? yearStart;
  int gamesCount;
  String imageBackground;

  PlatformPlatform({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.yearEnd,
    required this.yearStart,
    required this.gamesCount,
    required this.imageBackground,
  });

  PlatformPlatform copyWith({
    int? id,
    String? name,
    String? slug,
    dynamic image,
    dynamic yearEnd,
    int? yearStart,
    int? gamesCount,
    String? imageBackground,
  }) =>
      PlatformPlatform(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        image: image ?? this.image,
        yearEnd: yearEnd ?? this.yearEnd,
        yearStart: yearStart ?? this.yearStart,
        gamesCount: gamesCount ?? this.gamesCount,
        imageBackground: imageBackground ?? this.imageBackground,
      );

  factory PlatformPlatform.fromRawJson(String str) =>
      PlatformPlatform.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) =>
      PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}

class Requirements {
  String minimum;
  String? recommended;

  Requirements({
    required this.minimum,
    this.recommended,
  });

  Requirements copyWith({
    String? minimum,
    String? recommended,
  }) =>
      Requirements(
        minimum: minimum ?? this.minimum,
        recommended: recommended ?? this.recommended,
      );

  factory Requirements.fromRawJson(String str) =>
      Requirements.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"],
        recommended: json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "recommended": recommended,
      };
}

class Rating {
  int id;
  Title title;
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
    Title? title,
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
        title: titleValues.map[json["title"]]!,
        count: json["count"],
        percent: json["percent"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "count": count,
        "percent": percent,
      };
}

enum Title { EXCEPTIONAL, MEH, RECOMMENDED, SKIP }

final titleValues = EnumValues({
  "exceptional": Title.EXCEPTIONAL,
  "meh": Title.MEH,
  "recommended": Title.RECOMMENDED,
  "skip": Title.SKIP
});

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
  int id;
  Genre store;

  Store({
    required this.id,
    required this.store,
  });

  Store copyWith({
    int? id,
    Genre? store,
  }) =>
      Store(
        id: id ?? this.id,
        store: store ?? this.store,
      );

  factory Store.fromRawJson(String str) => Store.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        store: Genre.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store": store.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
