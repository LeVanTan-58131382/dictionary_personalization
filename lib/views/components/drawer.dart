import 'package:dictionary_personalization/common/utilities/constants.dart';
import 'package:dictionary_personalization/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),

          _createDrawerItem(
              icon: Icons.home,
              text: 'Trang chủ',
              onTap: () =>
                  Navigator.pushNamed(context, Routes.home)),

          Divider(),

          _createDrawerItem(
              icon: Icons.account_circle,
              text: 'Tài khoản',
              onTap: () =>
                  Navigator.pushNamed(context, Routes.profile)),

          Divider(),

          _createDrawerItem(
              icon: Icons.screen_search_desktop,
              text: 'Khám phá',
              onTap: () =>
                  Navigator.pushNamed(context, Routes.listUnitKnowledge)),

          Divider(),

          _createDrawerItem(
              icon: Icons.favorite_border,
              text: 'Yêu thích',
              onTap: () =>
                  Navigator.pushNamed(context, Routes.listUnitKnowledge)),

          Divider(),

          _createDrawerItem(
              icon: Icons.event,
              text: 'Sự kiện',
              onTap: () =>
                  Navigator.pushNamed(context, Routes.events)),

          Divider(),

          _createDrawerItem(
              icon: Icons.note,
              text: 'Ghi chú',
              onTap: () =>
                  Navigator.pushNamed(context, Routes.notes)),

          Divider(),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          // color: Colors.blue,
          image: DecorationImage(
              image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          )
            ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text(Const.APP_NAME,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      { required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}

