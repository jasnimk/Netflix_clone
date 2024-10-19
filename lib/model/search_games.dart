import 'dart:convert';

class SearchGamesModel {
  final int count;
  final String? next;
  final dynamic previous;
  final List<Result> results;
  final bool userPlatforms;

  SearchGamesModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
    required this.userPlatforms,
  });

  factory SearchGamesModel.fromRawJson(String str) =>
      SearchGamesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchGamesModel.fromJson(Map<String, dynamic> json) =>
      SearchGamesModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        userPlatforms: json["user_platforms"],
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
  final String slug;
  final String name;
  final int playtime;
  final List<Platform> platforms;
  final List<Store>? stores;
  final DateTime? released;
  final bool tba;
  final String backgroundImage;
  final double rating;
  final int ratingTop;
  final List<Rating> ratings;
  final int ratingsCount;
  final int reviewsTextCount;
  final int added;
  final AddedByStatus? addedByStatus;
  final dynamic metacritic;
  final int suggestionsCount;
  final DateTime updated;
  final int id;
  final String score;
  final dynamic clip;
  final List<Tag> tags;
  final dynamic esrbRating;
  final dynamic userGame;
  final int reviewsCount;
  final int? communityRating;
  final String saturatedColor;
  final String dominantColor;
  final List<ShortScreenshot> shortScreenshots;
  final List<Platform> parentPlatforms;
  final List<Genre> genres;

  Result({
    required this.slug,
    required this.name,
    required this.playtime,
    required this.platforms,
    this.stores,
    this.released,
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
    required this.score,
    this.clip,
    required this.tags,
    this.esrbRating,
    this.userGame,
    required this.reviewsCount,
    this.communityRating,
    required this.saturatedColor,
    required this.dominantColor,
    required this.shortScreenshots,
    required this.parentPlatforms,
    required this.genres,
  });

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
        released:
            json["released"] == null ? null : DateTime.parse(json["released"]),
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
        communityRating: json["community_rating"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        shortScreenshots: List<ShortScreenshot>.from(
            json["short_screenshots"].map((x) => ShortScreenshot.fromJson(x))),
        parentPlatforms: List<Platform>.from(
            json["parent_platforms"].map((x) => Platform.fromJson(x))),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "playtime": playtime,
        "platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
        "stores": stores == null
            ? null
            : List<dynamic>.from(stores!.map((x) => x.toJson())),
        "released": released?.toIso8601String(),
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status": addedByStatus?.toJson(),
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
        "community_rating": communityRating,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "short_screenshots":
            List<dynamic>.from(shortScreenshots.map((x) => x.toJson())),
        "parent_platforms":
            List<dynamic>.from(parentPlatforms.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class AddedByStatus {
  final int? owned;
  final int? toplay;
  final int? yet;
  final int? beaten;
  final int? dropped;
  final int? playing;

  AddedByStatus({
    this.owned,
    this.toplay,
    this.yet,
    this.beaten,
    this.dropped,
    this.playing,
  });

  factory AddedByStatus.fromRawJson(String str) =>
      AddedByStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        owned: json["owned"],
        toplay: json["toplay"],
        yet: json["yet"],
        beaten: json["beaten"],
        dropped: json["dropped"],
        playing: json["playing"],
      );

  Map<String, dynamic> toJson() => {
        "owned": owned,
        "toplay": toplay,
        "yet": yet,
        "beaten": beaten,
        "dropped": dropped,
        "playing": playing,
      };
}

class Genre {
  final int id;
  final String name;
  final String slug;

  Genre({
    required this.id,
    required this.name,
    required this.slug,
  });

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
  final Genre platform;

  Platform({
    required this.platform,
  });

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
  final int id;
  final String title;
  final int count;
  final double percent;

  Rating({
    required this.id,
    required this.title,
    required this.count,
    required this.percent,
  });

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
  final int id;
  final String image;

  ShortScreenshot({
    required this.id,
    required this.image,
  });

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
  final Genre store;

  Store({
    required this.store,
  });

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
  final int id;
  final String name;
  final String slug;
  final String language;
  final int gamesCount;
  final String? imageBackground;

  Tag({
    required this.id,
    required this.name,
    required this.slug,
    required this.language,
    required this.gamesCount,
    this.imageBackground,
  });

  factory Tag.fromRawJson(String str) => Tag.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        language: json["language"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "language": language,
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}
