import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/lib/Auth/user.dart';
import 'package:note/lib/Author_name.dart';
import 'package:note/lib/rating_page.dart';
import 'package:rating_bar/rating_bar.dart';

class Review_details extends StatefulWidget {
  String book;
  String Author;
  var b_id;
  var rating;
  var i_review;
  String publisher;
  var page;

  int p_year;
  Review_details(
      {this.b_id,
      this.rating,
      this.i_review,
      this.book,
      this.Author,
      this.publisher,
      this.page,
      this.p_year});

  _View_d createState() => _View_d(
      b_id: b_id,
      ratings: rating,
      i_review: i_review,
      book: book,
      publisher: publisher,
      Author: Author,
      page: page,
      p_year: p_year);
}

class _View_d extends State<Review_details> {
  String book;
  String Author;
  double ratings;
  var b_id;
  String publisher;
  var page;
  TextEditingController u_review = TextEditingController();
  var i_review;
  int p_year;
  _View_d(
      {this.i_review,
      this.b_id,
      this.ratings,
      this.p_year,
      this.publisher,
      this.page,
      this.Author,
      this.book});
  book_review Book_r;

  bool _review = true;
  bool _ireview = true;

  final User _auth = FirebaseAuth.instance.currentUser;
  final CollectionReference<Map<String, dynamic>> userrepo =
      FirebaseFirestore.instance.collection('users');

  bool loading = false;
  Future LoadBok_review() async {
    setState(() {
      loading = true;
    });
    final u_uid = _auth.uid;
    final DocumentSnapshot doc =
        await userrepo.doc(u_uid).collection('review').doc('$b_id').get();
    Map _docdata = doc.data();

    final Book_r = book_review.fromDocument(doc, _docdata);
    book = Book_r.book;
    b_id = Book_r.b_id;
    page = Book_r.page;
    Author = Book_r.Author;
    publisher = Book_r.publisher;
    p_year = Book_r.p_year;
    u_review.text = Book_r.u_review;
    i_review = Book_r.i_review;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    LoadBok_review();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Flexible(
              flex: 10,
              child: Container(
                  child: Stack(children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 310,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Color(0xffa358e8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset("assets/book_cover.jpg"),
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 330, top: 20),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0xffa358e8),
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  Add_cart(context));
                        },

                        ///add data in firebase user account},
                        icon: Icon(
                          Icons.add_shopping_cart,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ))
              ])),
            ),
            SizedBox(height: 20),
            Container(
              height: 3,
              width: double.infinity,
              color: Color(0xffa358e8),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                    flex: 3,
                    child: Text(
                      "Book",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  width: 20,
                ),
                Flexible(flex: 9, child: Text('$book')),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                    flex: 3,
                    child: Text(
                      "Author",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                    flex: 9,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Author_Page(
                                  Author: Author,
                                )));
                      },
                      child: Text(
                        '$Author',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Rating_Page(
                          rating: ratings,
                        )));
              },
              child: Row(
                children: [
                  Flexible(
                      flex: 3,
                      child: Text(
                        "Rating",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      flex: 3,
                      child: Text(
                        "$ratings",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )),
                  Flexible(
                      flex: 4,
                      child: RatingBar.readOnly(
                        initialRating: ratings,
                        size: 25,
                        isHalfAllowed: true,
                        halfFilledIcon: Icons.star_half,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        halfFilledColor: Color(0xffa358e8),
                        filledColor: Color(0xffa358e8),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                    flex: 3,
                    child: Text(
                      "Publisher",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                    flex: 9,
                    child: Text(
                      '$publisher',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                    flex: 3,
                    child: Text(
                      "Year",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                    flex: 9,
                    child: Text(
                      '$p_year',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                    flex: 3,
                    child: Text(
                      "Book Id",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                    flex: 9,
                    child: Text(
                      '$b_id',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                    flex: 3,
                    child: Text(
                      "Page",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                    flex: 9,
                    child: Text(
                      '$page',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Please edit book review",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            RatingBar(
                onRatingChanged: (rating) => setState(() => i_review = rating),
                size: 60,
                initialRating: i_review,
                filledIcon: Icons.star,
                filledColor: Color(0xffa358e8),
                emptyIcon: Icons.star_border),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                ///add review in user account
                // final use = DateTime.now().microsecondsSinceEpoch.toString();

                final FirebaseAuth user = FirebaseAuth.instance;
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(user.currentUser.uid)
                    .collection("review")
                    .doc('$b_id')
                    .update({"i_review": i_review});
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Color(0xffa358e8),
                      borderRadius: BorderRadius.circular(60)),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget Add_cart(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: new AlertDialog(
        title: Text(
          "Please add book in card",
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
                /// add  book in user account
                final use = DateTime.now().microsecondsSinceEpoch.toString();
                final FirebaseAuth user = FirebaseAuth.instance;
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(user.currentUser.uid)
                    .collection("book_list")
                    .doc("$b_id")
                    .set({
                  "user_name": user.currentUser.displayName,
                  "book": book,
                  "Author": Author,
                  "Rating": ratings,
                  "Publisher": publisher,
                  "P_year": p_year,
                  "page": page,
                  'b_id': b_id,
                  "u_review": u_review,
                  "i_review": i_review,
                  "add": "added"
                });
                Navigator.of(context).pop();
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
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Add",
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
