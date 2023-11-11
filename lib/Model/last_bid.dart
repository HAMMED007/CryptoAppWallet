import 'package:http/http.dart' as http;
import 'dart:convert';

LastBid lastBidFromJson(String str) => LastBid.fromJson(json.decode(str));

String lastBidToJson(LastBid data) => json.encode(data.toJson());

class LastBid {
  LastBid({
    required this.lastUpdateId,
    required this.bids,
    required this.asks,
  });

  int lastUpdateId;
  List<List<String>> bids;
  List<List<String>> asks;
  String p2pSell = "Loading...";

  String p2pBuy = "Loading...";

  factory LastBid.fromJson(Map<String, dynamic> json) => LastBid(
        lastUpdateId: json["lastUpdateId"],
        bids: List<List<String>>.from(
            json["bids"].map((x) => List<String>.from(x.map((x) => x)))),
        asks: List<List<String>>.from(
            json["asks"].map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "lastUpdateId": lastUpdateId,
        "bids": List<dynamic>.from(
            bids.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "asks": List<dynamic>.from(
            asks.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
