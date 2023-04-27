import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proto_ikan/model/fish_list_model.dart';

class FishListRepository {
  final _baseUrl = 'https://6430fd953adb159651639c30.mockapi.io';

  Future getFishListData() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/list'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<FishList> fishList = it.map((e) => FishList.fromJson(e)).toList();
        return fishList;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String title, String description) async {
    try {
      final response = await http.post(Uri.parse('$_baseUrl/list'), body: {
        'title': title,
        'description': description,
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
