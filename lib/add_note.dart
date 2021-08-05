import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:note/main.dart';

class AddNoteBloc extends FormBloc<String, String> {
  final title = TextFieldBloc();
  final description = TextFieldBloc();

  AddNoteBloc() {
    addFieldBlocs(fieldBlocs: [title, description]);
  }
  void AddErrors() {
    title.addFieldError("Title Error");
    description.addFieldError("Description Error");
  }

  @override
  void onSubmitting() async {
    try {
      await Future<void>.delayed(Duration(milliseconds: 500));
      final time = DateTime.now().microsecondsSinceEpoch;
      FirebaseFirestore.instance
          .collection("Note")
          .doc('$time')
          .set({"title": title, "description": description});
      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }
}

class Add_Note extends StatefulWidget {
  _addNote createState() => _addNote();
}

class _addNote extends State<Add_Note> {
  final _formKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => AddNoteBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<AddNoteBloc>(context);
          return Theme(
            data: Theme.of(context)
                .copyWith(inputDecorationTheme: InputDecorationTheme()),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffa358e8),
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Center(child: Text("Add Note")),
              ),
              body: FormBlocListener<AddNoteBloc, String, String>(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFieldBlocBuilder(
                            decoration: InputDecoration(
                              labelText: 'title',
                              labelStyle: TextStyle(color: Color(0xffa358e8)),
                              hintText: "Enter title",
                              icon: Icon(
                                Icons.flag_outlined,
                                color: Color(0xffa358e8),
                              ),
                            ),
                            textFieldBloc: formBloc.title),
                        TextFieldBlocBuilder(
                            decoration: InputDecoration(
                              labelText: 'Description',
                              labelStyle: TextStyle(color: Color(0xffa358e8)),
                              hintText: "Enter description",
                              icon: Icon(
                                Icons.description,
                                color: Color(0xffa358e8),
                              ),
                            ),
                            textFieldBloc: formBloc.description),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: formBloc.onSubmitting,
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: Color(0xffa358e8),
                                    borderRadius: BorderRadius.circular(29)),
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                BlocProvider.of<MyBloc>(context)
                                    .add(MyScreen.eventMain);
                              }, //=> Navigator.of(context).pop(),
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: Color(0xffc59ee5),
                                    borderRadius: BorderRadius.circular(29)),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  // TextEditingController title = TextEditingController();
  // TextEditingController description = TextEditingController();
//  final _formKey = new GlobalKey<ScaffoldState>();
  // @override
  // Widget build(BuildContext context) {
  // // TODO: implement build
  //return Scaffold(
  //key: _formKey,
  //    appBar: AppBar(
  //    backgroundColor: Color(0xffa358e8),
  // Here we take the value from the MyHomePage object that was created by
  // the App.build method, and use it to set our appbar title.
  //   title: Center(child: Text("Add Note")),
  // ),
  // body: Padding(
  // padding: const EdgeInsets.all(18.0),
  // child: ListView(
  //  mainAxisAlignment: MainAxisAlignment.center,
  // crossAxisAlignment: CrossAxisAlignment.center,
  //children: [
  ///   TextFormField(
  //  maxLengthEnforced: false,
  //maxLines: null,
  //  controller: title,
  //validator: (value) => value.isEmpty ? "Please Enter title" : null,
  // decoration: InputDecoration(
  // border: InputBorder.none,
  //   labelText: 'Title',
  // labelStyle: TextStyle(color: Color(0xffa358e8)),
  // hintText: "Enter title",
  // icon: Icon(
  // Icons.flag_outlined,
  //  color: Color(0xffa358e8),
  ///  ))/,
  //   ),
  // SizedBox(
  // height: 20,
  //  ),
  //TextFormField(
  //maxLengthEnforced: false,
  //   maxLines: null,
  // controller: description,
  // validator: (value) =>
  //   value.isEmpty ? "Please Enter description" : null,
  //    decoration: InputDecoration(
  //      labelText: 'Description',
  //    labelStyle: TextStyle(color: Color(0xffa358e8)),
  //   hintText: "Enter description",
  // icon: Icon(
  //   Icons.description,
  //  color: Color(0xffa358e8),
  //   )),
  // ),
  /// SizedBox(
  //height: 30,
  // ),
  // Row(
  // mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //   MaterialButton(
  //   onPressed: () {
  //   final time = DateTime.now().microsecondsSinceEpoch;
  //   FirebaseFirestore.instance
  //     .collection("Note")
  //   .doc('$time')
  //    .set({
  //     'title': title.text,
  //   "description": description.text
  // });
  //   var snack = SnackBar(content: Text("New note added"));
  // _formKey.currentState.showSnackBar(snack);
  //Navigator.of(context).push(
  //  MaterialPageRoute(builder: (context) => MyHomePage()));
  //    },
  //  child: Container(
  //  alignment: Alignment.center,
  //     height: 40,
  //   width: 90,
  // decoration: BoxDecoration(
  //   color: Color(0xffa358e8),
  //   borderRadius: BorderRadius.circular(29)),
  //    child: Text(
  //    "Save",
  //  style: TextStyle(
  //    color: Colors.white,
  //  fontSize: 18,
  // fontWeight: FontWeight.w800),
  //   ),
  // ),
  //),
  //MaterialButton(

  // onPressed: () {
  // BlocProvider.of<MyBloc>(context).add(MyScreen.eventMain);
  //},//=> Navigator.of(context).pop(),
  //   child: Container(
  //   alignment: Alignment.center,
  //      height: 40,
  //    width: 90,
  // decoration: BoxDecoration(
  //     color: Color(0xffc59ee5),
  //     borderRadius: BorderRadius.circular(29)),
  //  child: Text(
  //  "Cancel",
  //   style: TextStyle(
  //     color: Colors.white,
  //   fontSize: 18,
  // fontWeight: FontWeight.w800),
  ///      ),
  ///  ),
  //    ),
  //   ],
  //    )
  // ],
  // ),
  // ),
  //);
  //}
}
