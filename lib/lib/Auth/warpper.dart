import 'package:flutter/material.dart';
import 'package:note/lib/Auth/user.dart';
import 'package:note/lib/XDmainpage.dart';
import 'package:note/lib/open_app.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _Wrapper createState() => _Wrapper();
}

class _Wrapper extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final user = Provider.of<User_d>(
      context,
    );
    if (user == null) {
      return XDGooglePixel44XL1();
    } else {
      return XDmainpage();
    }
  }
}
