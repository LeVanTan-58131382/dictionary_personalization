import 'package:dictionary_personalization/common/utilities/constants.dart';
import 'package:dictionary_personalization/view_models/auth_viewmodel.dart';
import "package:http/http.dart" as http;
import "dart:convert";

import 'package:shared_preferences/shared_preferences.dart';

class NetworkHelper {
  NetworkHelper(this.apiUrl);

  //final String url; http.get() not allow string type of url
  final String apiUrl;

  var accessToken;

  Future getData() async {

    Uri fullUrl = Uri.parse(Const.BASE_API_URL + apiUrl)  ;

    await _getToken();

    http.Response response = await http.get(
        fullUrl,
        headers: _setHeaders(),
    );

    if(response.statusCode == 200) {
      var data = response.body;

      // print("json data: ${data}");
      // print("json decode: ${jsonDecode(data)}");
      // print("json decode listUnitKnowledge: ${jsonDecode(data)["listUnitKnowledge"]}");
      // print("json decode listUnitKnowledge id = 1: ${jsonDecode(data)["listUnitKnowledge"][0]}");
      // print("json decode listUnitKnowledge id = 1 subject: ${jsonDecode(data)["listUnitKnowledge"][0]["subject"]}");
      //
      // print("data type: ${jsonDecode(data)["listUnitKnowledge"].runtimeType}");
      // print("data type 0: ${jsonDecode(data)["listUnitKnowledge"][0].runtimeType}");


      // List<dynamic> arrayData = jsonDecode(data)["listUnitKnowledge"];
      //
      // List<Object> units = arrayData.map((unit) => unit as Object ).toList();
      //
      // print(units.length);
      //
      // units.forEach((element) {
      //   print("type of element: ${element.runtimeType}");
      // });
      //
      // final List<UnitKnowledgeModel> portasAbertasList =
      // arrayData.map((item) => UnitKnowledgeModel.fromJson(item)).toList();
      //
      // print("data: $portasAbertasList");

    return jsonDecode(data);

    } else {
      print("A network error occurred  ${response.statusCode}");
    }
  }

  Future postData(Object data) async {

    Uri fullUrl = Uri.parse(Const.BASE_API_URL + apiUrl)  ;

    await _getToken();

    http.Response response = await http.post(
        fullUrl,
        headers: _setHeaders(),
        body: data);

    if(response.statusCode == 200) {
      var data = response.body;

      return jsonDecode(data);

    } else {
      print("A network error occurred  ${response.statusCode}");
    }
  }

  _getToken() async {
    AuthViewModel authViewModel = new AuthViewModel();
    this.accessToken = await authViewModel.getCurrentAccessToken();
    print("accessToken (NetworkHelper - _getToken): ${this.accessToken}");
  }

  _setHeaders() => {
    'Content-type' : 'application/json; charset=UTF-8',
    'Accept' : 'application/json',
    'Authorization' : 'Bearer ${this.accessToken}'
  };

}