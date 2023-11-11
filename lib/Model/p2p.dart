class P2PModel {
  String p2pBuy = "Loading...";
  String p2pSell = "Loading...";
  P2PModel({required this.p2pBuy, required this.p2pSell});
  factory P2PModel.fromJson(Map<String, dynamic> json) => P2PModel(
        p2pBuy: json["lastUpdateId"],
        p2pSell: json["bids"],
      );
}
