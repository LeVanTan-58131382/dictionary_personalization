import 'package:dictionary_personalization/common/utilities/colors.dart';
import 'package:dictionary_personalization/view_models/unit_knowledge_viewmodel.dart';
import 'package:dictionary_personalization/views/knowledge/detail_unit_knowledge.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDetailUnitKnowledge extends StatefulWidget {

  final id;

  LoadingDetailUnitKnowledge({required this.id});

  @override
  State<StatefulWidget> createState() {
    return _LoadingDetailUnitKnowledge();
  }
}

class _LoadingDetailUnitKnowledge extends State<LoadingDetailUnitKnowledge> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUnitKnowledgeData(widget.id);
  }

  void getUnitKnowledgeData(int id) async{

    var data = await UnitKnowledgeViewModel().getUnitKnowledgeById("api/unit_knowledge/", id);
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailUnitKnowledge(
          unitKnowledgeModel: data
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments;
    // print("arguments: ${args}");
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