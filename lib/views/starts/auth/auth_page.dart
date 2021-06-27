import 'dart:async';
import 'package:dictionary_personalization/common/helper/dispatch_listener_event.dart';
import 'package:dictionary_personalization/common/utilities/colors.dart';
import 'package:dictionary_personalization/common/utilities/constants.dart';
import 'package:dictionary_personalization/routes/routes.dart';
import 'package:dictionary_personalization/view_models/auth_viewmodel.dart';
import 'package:dictionary_personalization/views/components/drawer.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {

  static const String routeName = '/auth';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DispatchListenerEvent.listener(
        Const.DISPATCH_GET_MESSAGE_RESULT_AUTH, getMessageResultAuth, Const.DISPATCH_GET_MESSAGE_RESULT_AUTH);

  }

  final _formKey = GlobalKey<FormState>();

  bool isCheck = false;
  bool isLogin = false;
  bool isSignUp = true;

  bool isRegistering = false;
  bool isRegistered = false;
  bool isLogging = false;
  bool isLogged = false;

  String result = ""; // "successful" or "failed"
  String messageResult = ""; // "login successful" or "login failed"

  String name = "";
  String email = "";
  String password = "";
  Map<String, String> userAccount = new Map<String, String>();

  void loginToServer(String name, String email, String password) async
  {
    userAccount = {"name" : name, "email" : email, "password" : password};
    await AuthViewModel().login(Const.API_LOGIN_USER_URL, userAccount);
  }
  
  void registerToServer(String name, String email, String password) async
  {
    userAccount = {"name" : name, "email" : email, "password" : password};
    await AuthViewModel().register(Const.API_REGISTER_USER_URL, userAccount);
  }

  getMessageResultAuth(String data)
  {
    var dataAfter = data.split('_');

    setState(() {
      this.result = dataAfter[1]; // result : success or failed
      this.messageResult = dataAfter[2]; // message:
    });

    // TODO: turn of notification
    Timer(Duration(seconds: 5), () {
      setState(() {
        this.result = "";
        this.messageResult = "";
      });

      if(dataAfter[1] == Const.SUCCESSFUL_STATUS && dataAfter[0] == "login")
      {
        Navigator.pop(context);
        Navigator.pushNamed(context, Routes.profile);
      }

      if(dataAfter[1] == Const.SUCCESSFUL_STATUS && dataAfter[0] == "register")
      {
        this.isLogin = true;
      }

    });
  }

  @override
  void dispose() {
    super.dispose();
    DispatchListenerEvent.remove(Const.DISPATCH_GET_MESSAGE_RESULT_AUTH, Const.DISPATCH_GET_MESSAGE_RESULT_AUTH);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        title: Text(Const.APP_NAME, style: TextStyle(fontSize: 16),),
        backgroundColor: Colors.black54,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isSignUp = true;
                      isLogin = false;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: isLogin == true ? ColorConstant.buttonSevenColor : ColorConstant.buttonFiveColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        Const.SIGN_UP,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSignUp = false;
                      isLogin = true;

                      _formKey.currentState?.reset();
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: isLogin ? ColorConstant.buttonFiveColor : ColorConstant.buttonSevenColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        Const.SIGN_IN,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(
                isLogin ? Const.SIGN_IN : Const.SIGN_UP,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                  color: ColorConstant.buttonFiveColor,
                ),
              ),
            ),

            Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      isLogin
                          ? Container()
                          :Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          onChanged: (text) {
                            //print('user_id: $text');
                            name = text;
                          },
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.person),
                            hintText: 'Nhập tên',
                            labelText: 'Tên',
                            labelStyle: TextStyle(color: ColorConstant.textColor),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.textColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.textColor),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.textColor),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Const.REQUIRED_MESSAGE;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: TextFormField(
                          onChanged: (text) {
                            //print('chủ đề: $text');
                            email = text;
                          },
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.email_outlined),
                            hintText: 'Nhập email',
                            labelText: 'Email',
                            labelStyle: TextStyle(color: ColorConstant.textColor),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.textColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.textColor),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.textColor),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Const.REQUIRED_MESSAGE;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: TextFormField(
                          onChanged: (text) {
                            //print('nội dung: $text');
                            password = text;
                          },
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.vpn_key_outlined),
                            hintText: 'Nhập mật khẩu',
                            labelText: 'Mật khẩu',
                            labelStyle: TextStyle(color: ColorConstant.textColor),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.textColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.textColor),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.textColor),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Const.REQUIRED_MESSAGE;
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isCheck,
                                onChanged: (value) {
                                  setState(() {
                                    isCheck = value!;
                                  });
                                },
                              ),
                              Text(
                                isLogin ? "Remember me" : "i agree with private policy",
                                style: TextStyle(
                                  color: ColorConstant.textColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            isLogin ? Const.FORGET_PASSWORD : "",
                            style: TextStyle(
                              color: Color(0xff3478a3),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      Container(
                          alignment: Alignment.center,
                          child: Container(
                            height: 48,
                            width: 135,
                            child: TextButton(
                              child: Text(isLogin ? Const.SIGN_IN: Const.SIGN_UP, style: TextStyle(color: ColorConstant.buttonFiveColor)),
                              onPressed: (){
                                if (_formKey.currentState!.validate()) {
                                  //TODO: Send data to server
                                  isLogin == true ?
                                  loginToServer(name, email, password) :
                                  registerToServer(name, email, password);

                                  FocusScope.of(context).unfocus();
                                }
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                          side: BorderSide(color: ColorConstant.buttonFiveColor)
                                      )
                                  )
                              ),
                            ),
                          ),
                        ),

                      SizedBox(
                        height: 30,
                      ),

                      Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      ),
                      this.messageResult != "" ?
                      Container(
                        margin: EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 50),
                        // height: double.infinity,
                        // width: double.infinity,
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: this.result == Const.SUCCESSFUL_STATUS ? Colors.green : Colors.redAccent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(child: Text(
                            this.messageResult,
                          style: TextStyle(color: Colors.white),
                        )),
                      )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}