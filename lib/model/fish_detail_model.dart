class FishDetail {
  late String kondisi;
  late String ukuran;
  late String berat;
  late String potongan;
  late String hargaDasar;
  late String quantity;
  late String totalHarga;
  late String kelipatan;
  late String id;

  FishDetail({
    required this.kondisi,
    required this.ukuran,
    required this.berat,
    required this.potongan,
    required this.hargaDasar,
    required this.quantity,
    required this.totalHarga,
    required this.kelipatan,
    required this.id,
  });

  FishDetail.fromJson(Map<String, dynamic> json) {
    kondisi = json['kondisi'];
    ukuran = json['ukuran'];
    berat = json['berat'];
    potongan = json['potongan'];
    hargaDasar = json['hargaDasar'];
    quantity = json['quantity'];
    totalHarga = json['totalHarga'];
    kelipatan = json['kelipatan'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kondisi'] = kondisi;
    data['ukuran'] = ukuran;
    data['berat'] = berat;
    data['potongan'] = potongan;
    data['hargaDasar'] = hargaDasar;
    data['quantity'] = quantity;
    data['totalHarga'] = totalHarga;
    data['kelipatan'] = kelipatan;
    data['id'] = id;
    return data;
  }
}
