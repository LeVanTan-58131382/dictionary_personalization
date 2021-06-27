import 'package:dictionary_personalization/common/utilities/colors.dart';
import 'package:dictionary_personalization/common/utilities/constants.dart';
import 'package:dictionary_personalization/models/account_model.dart';
import 'package:dictionary_personalization/routes/routes.dart';
import 'package:dictionary_personalization/view_models/auth_viewmodel.dart';
import 'package:dictionary_personalization/views/components/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {

  static const String routeName = '/profile';

  @override
  _MyProfile createState() => new _MyProfile();
}

class _MyProfile extends State<MyProfile> {

  String name = "asd";
  String email = "asd";

  AuthViewModel authViewModel = new AuthViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAccountInfo();
    // this.name = "Lê Văn Tân";
    // this.email = "levantan@gmail.com";

  }

  getAccountInfo() async
  {
    AccountModel accountModel = await authViewModel.getCurrentAccount();

    this.name = accountModel.name;
    this.email = accountModel.email;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: ColorConstant.backgroundFourColor.withOpacity(0.8)),
              clipper: getClipper(),
            ),
            Positioned(
                width: 350.0,
                top: MediaQuery.of(context).size.height / 5,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 150.0,
                        height: 150.0,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ClipRRect(
                              borderRadius:BorderRadius.circular(70),
                              child: Image.asset(
                                "images/profile_avatar_1.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                        ),
                    ),

                    SizedBox(height: 90.0),

                    Text(
                      "this.name",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      "this.email",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 25.0),

                    Container(
                      height: 50.0,
                      width: 200.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.redAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.home);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text("Trang chủ", style: TextStyle(color: Colors.white),),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Icon(Icons.home_outlined, color: Colors.white70,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25.0),

                    Container(
                      height: 50.0,
                      width: 200.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.redAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            authViewModel.deleteAccessToken("");
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text("Cài đặt", style: TextStyle(color: Colors.white),),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Icon(Icons.settings_outlined, color: Colors.white70,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25.0),

                    Container(
                      height: 50.0,
                      width: 200.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.redAccent,
                        color: Colors.red,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            authViewModel.deleteAccessToken("");
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(Const.SIGN_OUT, style: TextStyle(color: Colors.white),),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Icon(Icons.logout_outlined, color: Colors.white70,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
      drawer: AppDrawer(),
    );
  }
}

class getClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}