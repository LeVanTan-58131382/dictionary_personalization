import 'package:dictionary_personalization/common/utilities/constants.dart';
import 'package:dictionary_personalization/view_models/note_viewmodel.dart';
import 'package:dictionary_personalization/views/components/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNote extends StatefulWidget {

  static const String routeName = '/createNote';

  @override
  _CreateNote createState() {
    return _CreateNote();
  }
}

class _CreateNote extends State<CreateNote> {

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  void submitToServer(String idUser, String subject, String content) async
  {
    Map<String, String> data = {"id_user": idUser, "subject": subject, "content": content };
    await NoteViewModel().create(Const.API_CREATE_NOTE_URL, data);
  }
  
  @override
  Widget build(BuildContext context) {
    String idUser = "";
    String subject = "";
    String content = "";

    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text(Const.APP_BAR_TITLE),
        backgroundColor: Colors.black54,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Center(
              child: Text("Thêm note", style: TextStyle(color: Colors.teal, fontSize: 20),),
            ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    //print('user_id: $text');
                    idUser = text;
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Nhập user id',
                    labelText: 'User id',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Const.REQUIRED_MESSAGE;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onChanged: (text) {
                    //print('chủ đề: $text');
                    subject = text;
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.article_outlined),
                    hintText: 'Nhập chủ đề',
                    labelText: 'Chủ đề',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Const.REQUIRED_MESSAGE;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onChanged: (text) {
                    //print('nội dung: $text');
                    content = text;
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Nhập nội dung',
                    labelText: 'Nội dung',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Const.REQUIRED_MESSAGE;
                    }
                    return null;
                  },
                ),
                new Container(
                    padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                    child: new ElevatedButton(
                      child: const Text('Tạo note'),
                      onPressed: () {
                        submitToServer(idUser, subject, content);
                        // It returns true if the form is valid, otherwise returns false
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a Snackbar.
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Data is in processing.')));
                        }
                      },
                    )),
              ],
            ),
          ),
          ]
        ),
      ),
    );
  }
}