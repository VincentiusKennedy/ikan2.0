class FishList {
  late String name;
  late String detail;
  late String picture;
  late String location;
  late String date;
  late int price;
  late String status;
  late String id;

  FishList({
    required this.name,
    required this.detail,
    required this.picture,
    required this.location,
    required this.date,
    required this.price,
    required this.status,
    required this.id,
  });

  FishList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    detail = json['detail'];
    picture = json['picture'];
    location = json['location'];
    date = json['date'];
    price = json['price'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['detail'] = detail;
    data['picture'] = picture;
    data['location'] = location;
    data['date'] = date;
    data['price'] = price;
    data['status'] = status;
    data['id'] = id;
    return data;
  }
}
