// To parse this JSON data, do
//
//     final website = websiteFromJson(jsonString);

import 'dart:convert';

Website websiteFromJson(String str) => Website.fromJson(json.decode(str));

String websiteToJson(Website data) => json.encode(data.toJson());

class Website {
  Website({
    this.name,
    this.url,
    this.timer = 0,
    this.category = "S",
    this.dailyHits = 0,
    this.totalHits = 0,
    this.trafficSource = 'D',
    this.highQuality = true,
    this.pageScroll = true,
    this.clicks = true,
    this.reloadPage = true,
  });

  String name;
  String url;
  int timer;
  String category;
  int dailyHits;
  int totalHits;
  String trafficSource;
  bool highQuality;
  bool pageScroll;
  bool clicks;
  bool reloadPage;

  factory Website.fromJson(Map<String, dynamic> json) => Website(
        name: json["name"],
        url: json["url"],
        timer: json["timer"],
        category: json["category"],
        dailyHits: json["daily_hits"],
        totalHits: json["total_hits"],
        trafficSource: json["traffic_source"],
        highQuality: json["high_quality"],
        pageScroll: json["page_scroll"],
        clicks: json["clicks"],
        reloadPage: json["reload_page"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "timer": timer.toString(),
        "category": category,
        "daily_hits": dailyHits.toString(),
        "total_hits": totalHits.toString(),
        "traffic_source": trafficSource,
        "high_quality": highQuality.toString(),
        "page_scroll": pageScroll.toString(),
        "clicks": clicks.toString(),
        "reload_page": reloadPage.toString(),
      };
}
