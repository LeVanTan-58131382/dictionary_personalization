import 'package:dictionary_personalization/models/unit_knowledge.dart';
import 'package:dictionary_personalization/views/components/drawer.dart';
import 'package:dictionary_personalization/routes/routes.dart';
import 'package:flutter/material.dart';

class ListUnitKnowledge extends StatefulWidget{

  final List<UnitKnowledgeModel> listUnitKnowledge;

  ListUnitKnowledge({required this.listUnitKnowledge});

  static const String routeName = '/listUnitKnowledge';

  @override
  _ListUnitKnowledge createState() => _ListUnitKnowledge();
}

class _ListUnitKnowledge extends State<ListUnitKnowledge> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  myList() {
    return ListView.builder(
        itemCount: widget.listUnitKnowledge == null ? 0 : widget.listUnitKnowledge.length,
        itemBuilder: (BuildContext context, int index) {
          // More code here
          return Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.detailUnitKnowledge, arguments: widget.listUnitKnowledge[index].id);
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 2.0,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.screen_search_desktop),
                        title: Text("${widget.listUnitKnowledge[index].subject}",
                          style: TextStyle(color: Colors.teal, fontSize: 18),
                        ),

                        subtitle: Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 8.0, right: 0.0, bottom: 8.0),
                          child: Text(
                            'Khám phá thế giới',
                            style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 12),
                          ),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){

                        },
                      ),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                            "${widget.listUnitKnowledge[index].image}",
                            // width: 300,
                            height: 240,
                            fit:BoxFit.fill,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "${widget.listUnitKnowledge[index].content}",
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.favorite_border, color: Colors.blue,),
                                ),
                                Text('Thích')
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.assignment_rounded, color: Colors.blue,),
                                ),
                                Text('Lưu')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Khám phá kiến thức mới"),
          backgroundColor: Colors.black54,
        ),
        drawer: AppDrawer(),
        body: myList(),
    );
  }
}