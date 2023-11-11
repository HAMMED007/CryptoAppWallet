class Vendors {
  List<String> vendorNames;
  List<String> vendorDetail;
  List<String> website;
  List<String> phone;
  List<String> Links;

  Vendors(this.vendorNames, this.website, this.Links, this.vendorDetail,
      this.phone);

  Map<String, dynamic> toJson() => {
        "vendorNames": vendorNames,
        "vendorDetail": vendorDetail,
        "Links": Links,
        "website": website,
        "phone": phone,
      };
  factory Vendors.fromJson(Map<String, dynamic> json) => Vendors(
        List<String>.from(json["vendorNames"].map((x) => x)),
        List<String>.from(json["website"].map((x) => x)),
        List<String>.from(json["Links"].map((x) => x)),
        List<String>.from(json["vendorDetail"].map((x) => x)),
        List<String>.from(json["phone"].map((x) => x)),
      );
}

getDummyVendors() {
  return Vendors([
    "PP##",
    "Bitfinex",
    "Bitstamp",
    "Bittrex",
    "Coinbase",
    "Coinbase Pro",
    "Huobi",
  ], [
    " cryptocurrency exchange ",
    " cryptocurrency exchange",
    " cryptocurrency exchange",
    " exchange",
    " exchange",
    " exchange",
    "Huobi asd"
  ], [
    "https://www.bankrate.com/2021/09/07122021/GettyImages-1234552839.jpg?auto=webp&optimize=high&crop=16:9&width=912",
    "https://www.bankrate.com/2021/09/07122021/GettyImages-1234552839.jpg?auto=webp&optimize=high&crop=16:9&width=912",
    "https://images.unsplash.com/photo-1624438253998-7bb8eca8a3f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80",
    "https://images.unsplash.com/photo-1624438253998-7bb8eca8a3f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80",
    "https://images.unsplash.com/photo-1624438253998-7bb8eca8a3f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80",
    "https://www.bankrate.com/2021/09/07122021/GettyImages-1234552839.jpg?auto=webp&optimize=high&crop=16:9&width=912",
    "https://www.bankrate.com/2021/09/07122021/GettyImages-1234552839.jpg?auto=webp&optimize=high&crop=16:9&width=912",
    "https://www.bankrate.com/2021/09/07122021/GettyImages-1234552839.jpg?auto=webp&optimize=high&crop=16:9&width=912"
  ], [
    "https://www.bankrate.com",
    "https://www.bankrate.com",
    "https://www.bankrate.com",
    "https://www.bankrate.com",
    "https://www.bankrate.com",
    "https://www.bankrate.com",
    "https://www.bankrate.com",
    "https://www.bankrate.com",
  ], [
    "08181478869",
    "08181478869",
    "08181478869",
    "08181478869",
    "08181478869",
    "08181478869",
    "08181478869",
    "08181478869",
  ]);
}
// To parse this JSON data,
