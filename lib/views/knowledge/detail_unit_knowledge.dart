import 'package:dictionary_personalization/models/unit_knowledge.dart';
import 'package:dictionary_personalization/views/components/drawer.dart';
import 'package:flutter/material.dart';

class DetailUnitKnowledge extends StatefulWidget{

  static const String routeName = '/detailUnitKnowledge';

  final UnitKnowledgeModel unitKnowledgeModel;

  DetailUnitKnowledge({ required this.unitKnowledgeModel});

  @override
_DetailUnitKnowledge createState() => _DetailUnitKnowledge();
}

class _DetailUnitKnowledge extends State<DetailUnitKnowledge> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cùng xem chi tiết nhé!",
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Colors.black54,
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("${widget.unitKnowledgeModel.subject}")),

    );
  }
}