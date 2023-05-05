import 'dart:convert';

List<Fish> fishFromJson(String str) =>
    List<Fish>.from(json.decode(str).map((x) => Fish.fromJson(x)));

String fishToJson(List<Fish> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fish {
  String name;
  String detail;
  String picture;
  String location;
  String date;
  String price;
  String status;
  String id;
  List<Description> description;

  Fish({
    required this.name,
    required this.detail,
    required this.picture,
    required this.location,
    required this.date,
    required this.price,
    required this.status,
    required this.id,
    required this.description,
  });

  factory Fish.fromJson(Map<String, dynamic> json) {
    // print(json);
    return Fish(
      name: json["name"],
      detail: json["detail"],
      picture: json["picture"],
      location: json["location"],
      date: json["date"],
      price: json["price"],
      status: json["status"],
      id: json["id"],
      description: List<Description>.from(
          json["description"].map((x) => Description.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "detail": detail,
        "picture": picture,
        "location": location,
        "date": date,
        "price": price,
        "status": status,
        "id": id,
        "description": List<dynamic>.from(description.map((x) => x.toJson())),
      };
}

class Description {
  String kondisi;
  String ukuran;
  String berat;
  String potongan;
  String hargaDasar;
  String quantity;
  String totalHarga;
  String kelipatan;
  String id;
  String fishId;

  Description({
    required this.kondisi,
    required this.ukuran,
    required this.berat,
    required this.potongan,
    required this.hargaDasar,
    required this.quantity,
    required this.totalHarga,
    required this.kelipatan,
    required this.id,
    required this.fishId,
  });

  factory Description.fromJson(Map<String, dynamic> json) {
    // print(json);
    return Description(
      kondisi: json["kondisi"],
      ukuran: json["ukuran"],
      berat: json["berat"],
      potongan: json["potongan"],
      hargaDasar: json["hargaDasar"],
      quantity: json["quantity"],
      totalHarga: json["totalHarga"],
      kelipatan: json["kelipatan"],
      id: json["id"],
      fishId: json["fishId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "kondisi": kondisi,
        "ukuran": ukuran,
        "berat": berat,
        "potongan": potongan,
        "hargaDasar": hargaDasar,
        "quantity": quantity,
        "totalHarga": totalHarga,
        "kelipatan": kelipatan,
        "id": id,
        "fishId": fishId,
      };
}
