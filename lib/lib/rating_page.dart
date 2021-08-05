import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note/lib/Author_name.dart';
import 'package:note/lib/view_details.dart';
import 'package:rating_bar/rating_bar.dart';

class Rating_Page extends StatelessWidget {
  var rating;
  Rating_Page({this.rating});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffa358e8),
      appBar: AppBar(
        backgroundColor: Color(0xffa358e8),
        title: Row(
          children: [
            Text(
              "Sort by rating more $rating",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(
              width: 70,
            ),
          ],
        ),
      ),
      body: Center(
        child: StreamBuilder(
          stream: rootBundle.loadString("assets/book.json").asStream(),
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white60),
                  backgroundColor: Color(0xffa358e8),
                ),
              );
            } else {
              var jsonData = json.decode(snapshot.data);
              List rev = jsonData;
              rev = rev.toList();
              List R_list = [];
              for (int i = 0; i < rev.length; i++) {
                if (rev[i]['Rating'] >= rating) {
                  R_list.add(rev[i]);
                }
              }

              return ListView.builder(
                  itemCount: R_list.length,
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
                                R_list[i]["Name"],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 3,
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => Author_Page(
                                                  Author: R_list[i]['Authors'],
                                                )));
                                  },
                                  child: Text(
                                    R_list[i]["Authors"],
                                    style: TextStyle(fontSize: 13),
                                    maxLines: 2,
                                  ),
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
                                                      rating: R_list[i]
                                                          ['Rating'],
                                                    )));
                                      },
                                      child: Row(
                                        children: [
                                          Flexible(
                                              flex: 7,
                                              child: RatingBar.readOnly(
                                                initialRating: R_list[i]
                                                    ["Rating"],
                                                isHalfAllowed: true,
                                                size: 26,
                                                halfFilledIcon: Icons.star_half,
                                                filledIcon: Icons.star,
                                                emptyIcon: Icons.star_border,
                                                halfFilledColor:
                                                    Color(0xffa358e8),
                                                filledColor: Color(0xffa358e8),
                                              )
                                              //RatingBar.builder(
                                              // initialRating: x, //(rev[i]["Rating"]),
                                              // minRating: 0,
                                              //glowRadius: 30,
                                              //   direction: Axis.horizontal,
                                              // allowHalfRating: true,
                                              // itemCount: 5,
                                              // itemPadding:
                                              //  EdgeInsets.symmetric(horizontal: 4.0),
                                              //  itemBuilder: (context, _) => Icon(
                                              //  Icons.star,
                                              //color: Color(0xffa358e8),
                                              //),
                                              // onRatingUpdate: (rating) {
                                              // rev[i]["Rating"] = rating;
                                              //},
                                              // )

                                              ),
                                          Flexible(
                                              flex: 2,
                                              child: Text(
                                                  "${R_list[i]["Rating"]}/5")),
                                        ],
                                      ),
                                    ),
                                    MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      View_details(
                                                          book: R_list[i]
                                                              ["Name"],
                                                          ratings: R_list[i]
                                                              ["Rating"],
                                                          Author: R_list[i]
                                                              ["Authors"],
                                                          publisher: R_list[i]
                                                              ["Publisher"],
                                                          p_year: R_list[i]
                                                              ["PublishYear"],
                                                          page: R_list[i]
                                                              ['pagesNumber'],
                                                          b_id: R_list[i]
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
}
