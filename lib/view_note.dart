import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class View_Note extends StatelessWidget {
  String title;
  String description;

  View_Note({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa358e8),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text("View Note")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 10),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.flag_rounded,
                  color: Color(0xffa22de3),
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "$title",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              color: Color(0xffa358e8),
              thickness: 2,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.description,
                  color: Color(0xffa22de3),
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    width: 290,
                    child: Text(
                      "$description",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
                splashColor: Color(0xffa22de3),
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color(0xffa358e8),
                        borderRadius: BorderRadius.circular(29)),
                    child: Text(
                      "Back",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                onPressed: () => Navigator.of(context).pop())
          ],
        ),
      ),
    );
  }
}
