import 'dart:convert';
import 'package:dictionary_personalization/common/services/networking.dart';

class NoteViewModel {

  Future<dynamic> create(String apiUrl, Map<String, dynamic> data) async
  {
    NetworkHelper networkHelper = NetworkHelper(apiUrl);

    var dataToSend = jsonEncode(<String, String>{
      'id_user': data["id_user"],
      'subject': data["subject"],
      'content': data["content"],
    });

    print("${data["id_user"]}");
    print("${data["subject"]}");
    print("${data["content"]}");

    var response = await networkHelper.postData(dataToSend);
  }
}