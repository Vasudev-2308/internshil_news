// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:kalpas_project/constants/apikeys.dart';
// import 'package:kalpas_project/models/newsinfo.dart';
// import '../constants/apikeys.dart';

// class API_Manager {
//   Future<NewsModel> getNews() async {
//     var client = http.Client();
//     var newsModel = null;
//     try {
//       var response = await client.get(Uri.parse(Strings.news));
//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         var jsonMap = json.decode(jsonString);
//         newsModel = NewsModel.fromJson(jsonMap);
//       }
//     } catch (Exception) {
//       return newsModel;
//     }
//     return newsModel;
//   }
// }
