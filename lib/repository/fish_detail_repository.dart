// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:proto_ikan/model/fish_detail_model.dart';

// class FishDetailRepository {
//   final _baseUrl = 'https://6430fd953adb159651639c30.mockapi.io';

//   Future getFishDetail(String id) async {
//     try {
//       final response = await http.get(Uri.parse('$_baseUrl/fish/$id/detail'));

//       if (response.statusCode == 200) {
//         print(response.body);
//         Iterable it = jsonDecode(response.body);
//         List<FishDetail> fishDetail =
//             it.map((e) => FishDetail.fromJson(e)).toList();
//         return fishDetail;
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
