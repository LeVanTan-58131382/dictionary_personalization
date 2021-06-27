import 'package:dictionary_personalization/common/utilities/colors.dart';
import 'package:dictionary_personalization/view_models/unit_knowledge_viewmodel.dart';
import 'package:dictionary_personalization/views/knowledge/list_unit_knowledge.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingListUnitKnowledge extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoadingListUnitKnowledge();
  }

}

class _LoadingListUnitKnowledge extends State<LoadingListUnitKnowledge> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListUnitKnowledgeData();
  }

  void getListUnitKnowledgeData() async {
    var data = await UnitKnowledgeViewModel().getListUnitKnowledge("api/unit_knowledge/all");
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ListUnitKnowledge(
          listUnitKnowledge: data
      );
    }));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: ColorConstant.buttonFiveColor,
          size: 100.0,
        ),
      ),
    );
  }
}