import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/lib/Auth/authenticate.dart';
import 'package:note/lib/Auth/user.dart';
import 'package:note/lib/Auth/warpper.dart';
import 'package:note/view_note.dart';
import 'package:provider/provider.dart';

import 'add_note.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    StreamProvider<User_d>.value(
      value: AuthService().user,
      // initialData: null,
    ),
    BlocProvider(
      create: (context) => AddNoteBloc(),
      child: Add_Note(),
    ),
    BlocProvider(create: (context) => MyBloc(), child: MyApp())
  ], child: MyApp()));
}

enum MyScreen { eventMain, eventAdd, eventView }

@immutable
abstract class myState {}

class StateMain extends myState {}

class StateAdd extends myState {}

class StateView extends myState {}

class MyBloc extends Bloc<MyScreen, myState> {
  MyBloc() : super(StateMain());

  @override
  Stream<myState> mapEventToState(MyScreen event) async* {
    switch (event) {
      case MyScreen.eventMain:
        yield StateMain();
        break;
      case MyScreen.eventAdd:
        yield StateAdd();
        break;
      case MyScreen.eventView:
        yield StateView();
        break;
    }
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          'mainPage': (context) => Wrapper(),

          //MyHomePage(),
          "AddNote": (context) => Add_Note(),
          "ViewNote": (context) => View_Note()
        },
        initialRoute: 'mainPage',
        home: Wrapper()

        //MyHomePage(),
        );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BlocListener<MyBloc, myState>(
        listener: (context, state) {
          if (state is StateAdd) {
            Navigator.of(context).pushNamed('AddPage');
          }
          if (state is StateView) {
            Navigator.of(context).pushNamed("ViewPage");
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffa358e8),
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Center(child: Text("Note book")),
          ),
          body: Container(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Note").snapshots(),
              builder: (BuildContext context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xffa358e8),
                    ),
                  );
                else {
                  List rev = snapshot.data.docs.toList();
                  rev = rev.reversed.toList();

                  return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  "$i.  ",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  rev[i]["title"],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                rev[i]["description"],
                                style: TextStyle(fontSize: 13),
                                maxLines: 2,
                              ),
                            ),
                            trailing: MaterialButton(
                              child: Text("View all"),
                              onPressed: () {
                                //  BlocProvider.of<MyBloc>(context).add(MyScreen.eventView);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => View_Note(
                                          title: rev[i]['title'],
                                          description: rev[i]['description'],
                                        )));
                              },
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffa358e8),
            onPressed: () {
              // BlocProvider.of<MyBloc>(context).add(MyScreen.eventAdd);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Add_Note()));
            },
            //  tooltip: 'Increment',
            child: Icon(
              Icons.add,
              //  color: ,
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
