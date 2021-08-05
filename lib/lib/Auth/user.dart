import 'package:cloud_firestore/cloud_firestore.dart';

class User_d {
  String name;
  String email;
  String password;
  String book;
  String uid;
  User_d({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.book,
  });

  factory User_d.fromDocument(DocumentSnapshot doc, docdata) {
    return User_d(
        uid: docdata["uid"],
        name: docdata["name"],
        email: docdata["email"],
        password: docdata["password"],
        book: docdata['book']);
  }
}

class book_review {
  String name;
  String email;

  String book;
  String uid;
  String Author;
  double ratings;
  var b_id;
  String publisher;
  var page;
  String u_review;
  var i_review;
  int p_year;
  book_review(
      {this.uid,
      this.name,
      this.email,
      this.b_id,
      this.book,
      this.Author,
      this.p_year,
      this.publisher,
      this.page,
      this.u_review,
      this.i_review,
      this.ratings});

  factory book_review.fromDocument(DocumentSnapshot doc, docdata) {
    return book_review(
        uid: docdata["uid"],
        name: docdata["name"],
        email: docdata["email"],
        b_id: docdata["b_id"],
        book: docdata['book'],
        Author: docdata['Author'],
        publisher: docdata['Publisher'],
        page: docdata['page'],
        u_review: docdata['u_review'],
        i_review: docdata['i_review'],
        ratings: docdata['Rating']);
  }
}
