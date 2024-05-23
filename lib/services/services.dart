import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_restful_api_app/model/user_model.dart';

class ApiServices {
  String endpoint = "https://reqres.in/api/users?page=2";
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      //amaç 200 döndüğünde response.body içerisindeki veriyi almak
      final List result = jsonDecode(response.body)['data']; //bu satırda json verinin data kısmını alıyoruz
      return result
          .map((e) => UserModel.fromJson(e))
          .toList(); //map ile her bir elemanı UserModel.fromJson ile UserModel tipine çeviriyoruz ve listeye çeviriyoruz
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
