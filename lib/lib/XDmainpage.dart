import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note/lib/Auth/authenticate.dart';
import 'package:note/lib/Author_name.dart';
import 'package:note/lib/cart_list.dart';
import 'package:note/lib/open_app.dart';
import 'package:note/lib/rating_page.dart';
import 'package:note/lib/view_details.dart';
import 'package:rating_bar/rating_bar.dart';

class XDmainpage extends StatefulWidget {
  _HomePage createState() => _HomePage();

  XDmainpage({
    Key key,
  }) : super(key: key);
}

class _HomePage extends State<XDmainpage> {
  List L_data = [];

  bool _1Radio = false;
  bool _2Radio = false;
  bool _3Radio = false;
  bool _4Radio = false;

  var rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // showDialog(
              //   context: context,
              //  builder: (BuildContext context) => Logout(context));
              // AuthService().signOut();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Cart_list()));
            },
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.white,
            ),
            //color: Colors.white,
          ),
          SizedBox(
            width: 40,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => Logout(context));
              // AuthService().signOut();
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => XDGooglePixel44XL1()));
            },
            icon: Icon(
              Icons.logout,
              size: 30,
              color: Colors.white,
            ),
            //color: Colors.white,
          )
        ],
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Rating_sort(context));
              },

              icon: Icon(
                Icons.sort,
                size: 30,
                color: Colors.white,
              ),
              //color: Colors.white,
            ),
            Center(
                child: Text(
              "Book App",
            )),
          ],
        ),
        backgroundColor: Color(0xffa358e8),
      ),
      backgroundColor: Color(0xffa358e8),
      body: Center(
        child: StreamBuilder(
          stream: rootBundle.loadString("assets/book.json").asStream(),
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white60),
                    backgroundColor: Color(0xffa358e8)),
              );
            } else {
              var jsonData = json.decode(snapshot.data);
              List rev = jsonData;
              rev = rev.toList();

              return ListView.builder(
                  itemCount: rev.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        title: Row(
                          children: [
                            Flexible(
                              flex: 2,
                              child: Text(
                                "${i + 1}.  ",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Flexible(
                                flex: 3,
                                child: Container(
                                    child:
                                        Image.asset("assets/book_cover.jpg"))),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 8,
                              child: Text(
                                //rev[i]["Name"],
                                rev[i]["Name"],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Author_Page(
                                        Author: rev[i]['Authors'],
                                      )));
                            },
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Text(
                                    rev[i]["Authors"],
                                    style: TextStyle(fontSize: 13),
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Flexible(
                                  flex: 10,
                                  child: Column(
                                    children: [
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Rating_Page(
                                                        rating: rev[i]
                                                            ['Rating'],
                                                      )));
                                        },
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 7,
                                              child: RatingBar.readOnly(
                                                initialRating: rev[i]["Rating"],
                                                isHalfAllowed: true,
                                                size: 26,
                                                halfFilledIcon: Icons.star_half,
                                                filledIcon: Icons.star,
                                                emptyIcon: Icons.star_border,
                                                halfFilledColor:
                                                    Color(0xffa358e8),
                                                filledColor: Color(0xffa358e8),
                                              ),
                                            ),
                                            Flexible(
                                                flex: 2,
                                                child: Text(
                                                    "${rev[i]["Rating"]}/5")),
                                          ],
                                        ),
                                      ),
                                      MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        View_details(
                                                            book: rev[i]
                                                                ["Name"],
                                                            ratings: rev[i]
                                                                ["Rating"],
                                                            Author: rev[i]
                                                                ["Authors"],
                                                            publisher: rev[i]
                                                                ["Publisher"],
                                                            p_year: rev[i]
                                                                ["PublishYear"],
                                                            page: rev[i]
                                                                ['pagesNumber'],
                                                            b_id: rev[i]
                                                                ["Id"])));
                                          },
                                          child: Text(
                                            "View Details",
                                            style: TextStyle(
                                                color: Color(0xffa358e8)),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // trailing: MaterialButton(
                        // child: Text("View all"),
                        // onPressed: () {
                        //  BlocProvider.of<MyBloc>(context).add(MyScreen.eventView);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => XDiPhoneXXS11Pro2()));
                        //},
                        //),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }

  Widget Logout(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: new AlertDialog(
        // title: Text(
        // "Please add in card",
        // style: TextStyle(
        // fontSize: 15,
        // ),
        // ),
        //content: Column(
        //children: [Text("Add")],
        //),
        actions: [
          new FlatButton(
              onPressed: () {
                AuthService().signOut();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => XDGooglePixel44XL1()));
              },
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffa358e8),
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.logout,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 15, color: Color(0xffa358e8)),
                  ),
                ],
              )),
          SizedBox(width: 90),
          FlatButton(
              // color: Colors.cyanAccent,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.clear,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text("Cancel",
                      style: TextStyle(fontSize: 15, color: Colors.redAccent)),
                ],
              ))
        ],
      ),
    );
  }

  Widget Rating_sort(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: new AlertDialog(
        title: Text(
          "Please sort by ratings",
          style: TextStyle(
            color: Color(0xffa358e8),
            fontSize: 15,
          ),
        ),
        content: Container(
          height: 230,
          width: 100,
          child: Column(
            children: [
              FlatButton(
                // color: Colors.cyanAccent,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Rating_Page(
                            rating: 1.0,
                          )));
                },
                child: RadioListTile(
                  groupValue: _1Radio ? false : true,
                  value: false,
                  title: Text(
                    "1.0",
                    style: TextStyle(
                      fontFamily: 'Constantia',
                      fontSize: 14,
                      color: Color(0xffa109c5),
                    ),
                  ),
                  activeColor: const Color(0xffa109c5),
                  onChanged: (val) {
                    setState(() => _1Radio = !_1Radio);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Rating_Page(
                              rating: 1.0,
                            )));
                  },
                ),
              ),
              FlatButton(
                // color: Colors.cyanAccent,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Rating_Page(
                            rating: 2.0,
                          )));
                },
                child: RadioListTile(
                  groupValue: _2Radio ? false : true,
                  value: false,
                  title: Text(
                    "2.0",
                    style: TextStyle(
                      fontFamily: 'Constantia',
                      fontSize: 14,
                      color: Color(0xffa109c5),
                    ),
                  ),
                  activeColor: const Color(0xffa109c5),
                  onChanged: (val) {
                    setState(() => _2Radio = !_2Radio);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Rating_Page(
                              rating: 2.0,
                            )));
                  },
                ),
              ),
              FlatButton(
                // color: Colors.cyanAccent,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Rating_Page(
                            rating: 3.0,
                          )));
                },
                child: RadioListTile(
                  groupValue: _3Radio ? false : true,
                  value: false,
                  title: Text(
                    "3.0",
                    style: TextStyle(
                      fontFamily: 'Constantia',
                      fontSize: 14,
                      color: Color(0xffa109c5),
                    ),
                  ),
                  activeColor: const Color(0xffa109c5),
                  onChanged: (val) {
                    setState(() => _3Radio = !_3Radio);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Rating_Page(
                              rating: 3.0,
                            )));
                  },
                ),
              ),
              FlatButton(
                // color: Colors.cyanAccent,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Rating_Page(
                            rating: 4.0,
                          )));
                },
                child: RadioListTile(
                  groupValue: _4Radio ? false : true,
                  value: false,
                  title: Text(
                    "4.0",
                    style: TextStyle(
                      fontFamily: 'Constantia',
                      fontSize: 14,
                      color: Color(0xffa109c5),
                    ),
                  ),
                  activeColor: const Color(0xffa109c5),
                  onChanged: (val) {
                    setState(() => _4Radio = !_4Radio);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Rating_Page(
                              rating: 4.0,
                            )));
                  },
                ),
              )
            ],
          ),
        ),
        actions: [
          SizedBox(width: 0),
          FlatButton(
              // color: Colors.cyanAccent,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.clear,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text("Cancel",
                      style: TextStyle(fontSize: 15, color: Colors.redAccent)),
                ],
              ))
        ],
      ),
    );
  }
}

const String _svg_tdxpcw =
    '<svg viewBox="15.5 25.5 39.0 1.0" ><path transform="translate(15.5, 25.5)" d="M 39 0 L 0 0" fill="none" stroke="#a109c5" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ny1e93 =
    '<svg viewBox="15.5 36.0 28.0 1.0" ><path transform="translate(15.5, 36.0)" d="M 28 0.5 L 0 0" fill="none" stroke="#a109c5" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_41702o =
    '<svg viewBox="15.5 46.5 28.0 1.0" ><path transform="translate(15.5, 46.5)" d="M 28 0 L 0 0" fill="none" stroke="#a109c5" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
