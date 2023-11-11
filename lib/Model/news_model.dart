import 'dart:convert';

class NewsModel {
  String status = "";
  int totalResults = 0;
  List<Results> results = [];
  int nextPage = 1;

  NewsModel(
      {this.status = "",
      required this.totalResults,
      required this.results,
      required this.nextPage});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'] ?? 0;
    if (json['results'] != null) {
      results = [];
      print(json['results']);
      // json['results'].forEach((v) {
      //   results.add(Results.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String title = "";
  String link = "";
  List<String> keywords = [];
  List<String> creator = [];
  String videoUrl = "";
  String description = "";
  String content = "";
  String pubDate = "";
  String imageUrl = "";
  String sourceId = "";
  List<String> country = [];
  List<String> category = [];
  String language = "";

  Results(
      {required this.title,
      required this.link,
      required this.keywords,
      required this.creator,
      required this.videoUrl,
      required this.description,
      required this.content,
      required this.pubDate,
      required this.imageUrl,
      required this.sourceId,
      required this.country,
      required this.category,
      required this.language});

  Results.fromJson(Map<String, dynamic> json) {
    title = utf8.decode(json['title'].codeUnits);
    link = json['link'];

    creator = json['creator'].cast<String>();
    description = utf8.decode(json['description'].codeUnits);

    content = json['content'] ?? "";
    pubDate = json['pubDate'] ?? "";
    imageUrl = "";
    sourceId = json['source_id'] ?? "";
    country =
        json['country'] == null ? "" : json['country'].cast<String>() ?? [];
    category =
        json['category'] == null ? "" : json['category'].cast<String>() ?? [];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['keywords'] = this.keywords;
    data['creator'] = this.creator;
    data['video_url'] = this.videoUrl;
    data['description'] = this.description;
    data['content'] = this.content;
    data['pubDate'] = this.pubDate;
    data['image_url'] = this.imageUrl;
    data['source_id'] = this.sourceId;
    data['country'] = this.country;
    data['category'] = this.category;
    data['language'] = this.language;
    return data;
  }
}
