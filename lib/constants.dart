import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hoverColor: Colors.orange,
  fillColor: Colors.black38,
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffa109c5), width: 1.5),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
  focusColor: Color(0xffa109c5),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffa109c5), width: 1.5),
  ),
);

class examp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Padding(
        padding: const EdgeInsets.only(top: 50, left: 29),
        child: Row(children: [
          Expanded(
            flex: 7,
            child: Text("Bhooli", style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: Container(
              height: 40,
              width: 40,
              alignment: Alignment.topRight,
              child: Image.asset("assets/info.png"),
            ),
          )
        ]),
      ),
      Padding(
          padding: const EdgeInsets.only(left: 20, top: 100),
          child: Row(children: [
            Expanded(
                flex: 3,
                child: Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.bottomLeft,
                  child: Image.asset("assets/edit.png"),
                )),
            Expanded(
              flex: 5,
              child: Text("View More"),
            ),
          ])),
    ]));
  }
}
