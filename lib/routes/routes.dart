import 'package:dictionary_personalization/views/account/profile.dart';
import 'package:dictionary_personalization/views/components/events_page.dart';
import 'package:dictionary_personalization/views/components/notes_page.dart';
import 'package:dictionary_personalization/views/home_page/home_page.dart';
import 'package:dictionary_personalization/views/knowledge/detail_unit_knowledge.dart';
import 'package:dictionary_personalization/views/knowledge/list_unit_knowledge.dart';
import 'package:dictionary_personalization/views/starts/auth/auth_page.dart';

class Routes {
  static const String home = HomePage.routeName;
  static const String events = EventsPage.routeName;
  static const String notes = NotesPage.routeName;
  static const String auth = AuthPage.routeName;
  static const String profile = MyProfile.routeName;

  static const String listUnitKnowledge = ListUnitKnowledge.routeName;
  static const String detailUnitKnowledge = DetailUnitKnowledge.routeName;


}