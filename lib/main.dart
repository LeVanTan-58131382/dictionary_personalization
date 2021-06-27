import 'package:dictionary_personalization/common/utilities/constants.dart';
import 'package:dictionary_personalization/routes/routes.dart';
import 'package:dictionary_personalization/views/account/profile.dart';
import 'package:dictionary_personalization/views/components/notes_page.dart';
import 'package:dictionary_personalization/views/loading_page/loading_detail_unit_knowledge.dart';
import 'package:dictionary_personalization/views/loading_page/loading_list_unit_knowledge.dart';
import 'package:dictionary_personalization/views/starts/auth/auth_page.dart';
import 'package:flutter/material.dart';

import 'views/components/events_page.dart';
import 'views/home_page/home_page.dart';
import 'views/knowledge/list_unit_knowledge.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        Routes.home: (context) => HomePage(),
        Routes.auth: (context) => AuthPage(),
        Routes.profile: (context) => MyProfile(),
        Routes.events: (context) => EventsPage(),
        Routes.notes: (context) => NotesPage(),
        Routes.listUnitKnowledge: (context) => LoadingListUnitKnowledge(),
        Routes.detailUnitKnowledge: (context) {
          var args = ModalRoute.of(context)?.settings.arguments;
          // print("arguments: ${args}");
          // print("type arg: ${args.runtimeType}");
          return LoadingDetailUnitKnowledge(id: args);},
      },
    );
  }
}


