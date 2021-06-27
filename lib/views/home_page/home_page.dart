import 'package:dictionary_personalization/common/utilities/constants.dart';
import 'package:dictionary_personalization/views/account/profile.dart';
import 'package:dictionary_personalization/views/loading_page/loading_list_unit_knowledge.dart';
import 'package:dictionary_personalization/views/components/drawer.dart';
import 'package:dictionary_personalization/views/starts/auth/auth_page.dart';
import 'package:dictionary_personalization/views/starts/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    // neu return MaterialApp tai cho nay thi route se ko hoat dong
    return Scaffold(
      body: MyHomePage(),
      //body: CreateNote(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(Const.APP_NAME, style: TextStyle(fontSize: 16),),
          backgroundColor: Colors.black54,
      ),
      //body: LoadingListUnitKnowledge(),
      body: WelcomePage(),
      //body: MyProfile(),
      drawer: AppDrawer(),
    );
  }
}