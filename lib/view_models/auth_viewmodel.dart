import 'dart:async';
import 'dart:convert';
import 'package:dictionary_personalization/common/helper/dispatch_listener_event.dart';
import 'package:dictionary_personalization/common/services/networking.dart';
import 'package:dictionary_personalization/common/utilities/constants.dart';
import 'package:dictionary_personalization/models/account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel {

  static String _currentAccessToken = "";
  final Future<SharedPreferences> _accessToken = SharedPreferences.getInstance();
  static AccountModel accountModel = new AccountModel(name: "", email: "");

  Future<dynamic> register(String apiUrl, Map<String, dynamic> data) async
  {
    NetworkHelper networkHelper = NetworkHelper(apiUrl);

    var dataToSend = jsonEncode(<String, String>{
      'name': data["name"],
      'email': data["email"],
      'password': data["password"],
    });

    print("${data["name"]}");
    print("${data["email"]}");
    print("${data["password"]}");

    var response = await networkHelper.postData(dataToSend);

    if(response["result"] == Const.SUCCESSFUL_STATUS || response["result"] == Const.FAILED_STATUS)
    {
      var messageData = "register" + "_" + response["result"] + "_" + response["message"];

      DispatchListenerEvent.dispatch(Const.DISPATCH_GET_MESSAGE_RESULT_AUTH, messageData);

    }

  }

  Future<dynamic> login(String apiUrl, Map<String, dynamic> data) async
  {
    NetworkHelper networkHelper = NetworkHelper(apiUrl);

    var dataToSend = jsonEncode(<String, String>{
      'name': data["name"],
      'email': data["email"],
      'password': data["password"],
    });

    print("${data["name"]}");
    print("${data["email"]}");
    print("${data["password"]}");

    var response = await networkHelper.postData(dataToSend);

    print(response["result"]);

    if(response["result"] == Const.SUCCESSFUL_STATUS)
      {
        await saveAccessToken(response["accessToken"]);

        Map<String, dynamic> userResponse = response["user"];

        accountModel = AccountModel.fromJson(userResponse);

        var messageData = "login" + "_" + response["result"] + "_" + response["message"];

        DispatchListenerEvent.dispatch(Const.DISPATCH_GET_MESSAGE_RESULT_AUTH, messageData);

      }

    if(response["result"] == Const.FAILED_STATUS)
      {
        var messageData = "login" + "_" + response["result"] + "_" + response["message"];

        DispatchListenerEvent.dispatch(Const.DISPATCH_GET_MESSAGE_RESULT_AUTH, messageData);
      }
  }

  AccountModel getCurrentAccount()
  {
    return accountModel;
  }

   checkIfLoggedIn() async{

    var accessToken = await getCurrentAccessToken();

    if(accessToken != ""){
      return true;     // logged
    }
    return false;     // not logged
  }

  // TODO: Get token after login success
  getCurrentAccessToken() async
  {
    final SharedPreferences accessToken = await _accessToken;
    _currentAccessToken = accessToken.getString("currentToken") ?? "";

    print("currentToken from local storage: $_currentAccessToken");

    return _currentAccessToken;
  }

  // TODO: Save token when user login - for auto login
  saveAccessToken(String currentToken) async {
    final SharedPreferences accessToken = await _accessToken;
    accessToken.setString("currentToken", currentToken);
    _currentAccessToken = currentToken;

    print("currentToken after save: $_currentAccessToken");
  }

  deleteAccessToken(String tokenEmpty) async {
    final SharedPreferences accessToken = await _accessToken;
    accessToken.setString("currentToken", tokenEmpty);
    _currentAccessToken = tokenEmpty;

    print("currentToken after delete: $_currentAccessToken");
  }

}