import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/fish_list_model.dart';
import '../utils/schedulled_notif.dart';

class FishRepository {
  final _baseUrl = 'https://6430fd953adb159651639c30.mockapi.io';
  // https://6430fd953adb159651639c30.mockapi.io/fish?page=1&limit=3 (kalo mau pagination)

  Future getFishData() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/fish'));

      if (response.statusCode == 200) {
        // print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Fish> fishList = it.map((e) => Fish.fromJson(e)).toList();
        scheduleNotification(fishList);
        return fishList;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getFishDetail(String id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/fish/$id'));

      if (response.statusCode == 200) {
        List<Fish> fishDetail = [Fish.fromJson(jsonDecode(response.body))];
        return fishDetail;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
