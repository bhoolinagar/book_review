import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/lib/Author_name.dart';
import 'package:note/lib/my_review_list.dart';
import 'package:note/lib/rating_page.dart';
import 'package:note/lib/view_details.dart';
import 'package:rating_bar/rating_bar.dart';

class Cart_list extends StatefulWidget {
  _cart_list createState() => _cart_list();
}

class _cart_list extends State<Cart_list> {
  final String u_uid = FirebaseAuth.instance.currentUser.uid;
  final CollectionReference<Map<String, dynamic>> cart_repo =
      FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffa358e8),
      appBar: AppBar(
        backgroundColor: Color(0xffa358e8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
            ),
            Text(
              "My book list",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 120,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Review_list()));
              },
              icon: Icon(
                Icons.star,
                color: Color(0xffe9e9ea),
                size: 40,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: cart_repo.doc(u_uid).collection("book_list").snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white60),
                  backgroundColor: Color(0xffa358e8)),
            );
          } else {
            // var jsonData = json.decode(snapshot.data);
            List rev = snapshot.data.docs.toList();
            rev = rev.reversed.toList();

            //  List rev = jsonData;
            // rev = rev.toList();

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
                                  child: Image.asset("assets/book_cover.jpg"))),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 8,
                            child: Text(
                              //rev[i]["Name"],
                              rev[i]["book"],
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
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
                                      Author: rev[i]['Author'],
                                    )));
                          },
                          child: Row(
                            children: [
                              Flexible(
                                flex: 3,
                                child: Text(
                                  rev[i]["Author"],
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
                                                      rating: rev[i]['Rating'],
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
                                    Row(
                                      children: [
                                        MaterialButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          View_details(
                                                              book: rev[i]
                                                                  ["book"],
                                                              ratings: rev[i]
                                                                  ["Rating"],
                                                              Author: rev[i]
                                                                  ["Author"],
                                                              publisher: rev[i]
                                                                  ["Publisher"],
                                                              p_year: rev[i]
                                                                  ["P_year"],
                                                              page: rev[i]
                                                                  ['page'],
                                                              b_id: rev[i]
                                                                  ["b_id"])));
                                            },
                                            child: Text(
                                              "View Details",
                                              style: TextStyle(
                                                  color: Color(0xffa358e8)),
                                            )),
                                        MaterialButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          delete(context,
                                                              rev[i]['b_id']));

                                              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => View_details()
                                            },
                                            child: Icon(Icons.delete_rounded,
                                                size: 30,
                                                color: Color(0xffa358e8)))
                                      ],
                                    )
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
    );
  }

  Widget delete(BuildContext context, var b_id) {
    return Container(
      height: 100,
      width: 100,
      child: new AlertDialog(
        title: Text(
          "Are you delete book from card",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        //content: Column(
        //children: [Text("Add")],
        //),
        actions: [
          new FlatButton(
              onPressed: () {
                cart_repo
                    .doc(u_uid)
                    .collection("book_list")
                    .doc('$b_id')
                    .delete();
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => XDGooglePixel44XL1()));
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
                      Icons.delete_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Delete",
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
}
