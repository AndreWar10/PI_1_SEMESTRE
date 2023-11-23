class NewsModel {
  NewsModel(
      {required this.id,
      required this.title,
      required this.url,
      required this.imageUrl,
      required this.newsSite,
      required this.summary,
      required this.publishedAt,
      required this.updatedAt,
      required this.featured,
      required this.launches,
      required this.events,
      required this.likes});

  int id;
  String title;
  String url;
  String imageUrl;
  String newsSite;
  String summary;
  DateTime publishedAt;
  DateTime updatedAt;
  bool featured;
  int likes;
  List<Launch> launches;
  List<Event> events;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        imageUrl: json["image_url"] ?? '',
        newsSite: json["news_site"],
        summary: json["summary"],
        publishedAt: DateTime.parse(json["published_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        featured: json["featured"],
        launches:
            List<Launch>.from(json["launches"].map((x) => Launch.fromJson(x))),
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        likes: 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "imageUrl": imageUrl,
        "newsSite": newsSite,
        "summary": summary,
        "publishedAt": publishedAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "featured": featured,
        "launches": List<dynamic>.from(launches.map((x) => x.toJson())),
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    required this.id,
    required this.provider,
  });

  int id;
  String provider;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["event_id"],
        provider: json["provider"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "provider": provider,
      };
}

class Launch {
  Launch({
    required this.id,
    required this.provider,
  });

  String id;
  String provider;

  factory Launch.fromJson(Map<String, dynamic> json) => Launch(
        id: json["launch_id"],
        provider: json["provider"],
      );

  Map<String, dynamic> toJson() => {
        "event_id": id,
        "provider": provider,
      };
}
