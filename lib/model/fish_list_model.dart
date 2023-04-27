class FishList {
  late String title;
  late String description;
  late String pictureLink;
  late String tanggal;
  late String id;

  FishList({
    required this.title,
    required this.description,
    required this.pictureLink,
    required this.tanggal,
    required this.id,
  });

  FishList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    pictureLink = json['pictureLink'];
    tanggal = json['tanggal'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['pictureLink'] = pictureLink;
    data['tanggal'] = tanggal;
    data['id'] = id;
    return data;
  }
}
