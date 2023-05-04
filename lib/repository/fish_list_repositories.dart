import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proto_ikan/model/fish_detail_model.dart';
import 'package:proto_ikan/model/fish_list_model.dart';
import 'package:proto_ikan/utils/schedulled_notif.dart';

class FishListRepository {
  final _baseUrl = 'https://6430fd953adb159651639c30.mockapi.io';

  Future getFishListData() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/fish'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<FishList> fishList = it.map((e) => FishList.fromJson(e)).toList();
        scheduleNotification(fishList);
        return fishList;
      }
    } catch (e) {
      print(e.toString());
    }
  }

// https://6430fd953adb159651639c30.mockapi.io/fish?page=1&limit=3 (kalo mau pagination)

  Future getFishDetail(String id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/fish/$id/detail'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<FishDetail> fishDetail =
            it.map((e) => FishDetail.fromJson(e)).toList();
        return fishDetail;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Future postData(String title, String description) async {
  //   try {
  //     final response = await http.post(Uri.parse('$_baseUrl/list'), body: {
  //       'title': title,
  //       'description': description,
  //     });

  //     if (response.statusCode == 201) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
