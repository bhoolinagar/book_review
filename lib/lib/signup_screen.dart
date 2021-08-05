import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/constants.dart';
import 'package:note/lib/Auth/authenticate.dart';
import 'package:note/lib/login_screen.dart';
import './XDmainpage.dart';

class XDArtboard1 extends StatefulWidget {
  _Signup_screen createState() => _Signup_screen();

  XDArtboard1({
    Key key,
  }) : super(key: key);
}

class _Signup_screen extends State<XDArtboard1> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final DateTime timestamp = DateTime.now();
  bool loading = false;
  String name = " ";
  String email = " ";
  String password = " ";
  String error = " ";
  bool _isHidden = true;
  bool _isRadio = false;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 183.7, start: 23.4),
            Pin(size: 282.8, start: 47.5),
            child: SvgPicture.string(
              _svg_fandjj,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 200.3, end: 13.5),
            Pin(size: 288.2, start: 38.5),
            child: SvgPicture.string(
              _svg_6tbjiq,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 36.4, end: 22.3),
            Pin(size: 265.6, start: 53.0),
            child: SvgPicture.string(
              _svg_9kdzln,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 93.4, end: 53.5),
            Pin(size: 105.5, start: 69.5),
            child: SvgPicture.string(
              _svg_mzie4c,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 8.0, start: 278.6628),
            Pin(size: 18.0, start: 105.4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 9.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 10.0, middle: 0.7523),
            Pin(size: 17.0, start: 107.1),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 5.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 33.5, start: 280.7098),
            Pin(size: 12.5, start: 136.5),
            child: SvgPicture.string(
              _svg_aau26g,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.5, start: 360.9155),
            Pin(size: 17.0, start: 120.2021),
            child: Transform.rotate(
              angle: -1.5708,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xfff9cb96),
                  border:
                      Border.all(width: 1.0, color: const Color(0xfff9cb96)),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 20.0, middle: 0.6681),
            Pin(size: 20.0, start: 103.8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xadffffff),
                border: Border.all(width: 1.0, color: const Color(0xad707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 20.0, middle: 0.7514),
            Pin(size: 22.0, start: 104.4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0x9effffff),
                border: Border.all(width: 1.0, color: const Color(0x9e707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 53.0, end: 47.5),
            Pin(size: 2.0, start: 110.5),
            child: SvgPicture.string(
              _svg_np1rsp,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 47.8, middle: 0.5093),
            Pin(size: 26.8, middle: 0.2371),
            child: Transform.rotate(
              angle: 0.4014,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.0),
                  color: const Color(0xffa109c5),
                  border:
                      Border.all(width: 1.0, color: const Color(0xffa109c5)),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 25.8, middle: 0.6118),
            Pin(size: 81.1, middle: 0.2168),
            child: Transform.rotate(
              angle: 1.2566,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: const Color(0xffa109c5),
                  border:
                      Border.all(width: 1.0, color: const Color(0xffa109c5)),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 93.2, end: 53.5),
            Pin(size: 108.1, middle: 0.2232),
            child: SvgPicture.string(
              _svg_nrc8wz,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 249.0, start: 57.0),
            Pin(size: 78.0, middle: 0.1766),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 36,
                color: const Color(0xffa109c5),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14.5, middle: 0.7552),
            Pin(size: 11.1, middle: 0.2602),
            child: SvgPicture.string(
              _svg_6mcjl0,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 13.0, middle: 0.7538),
            Pin(size: 41.0, middle: 0.2207),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xffffffff)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 51.9, middle: 0.7663),
            Pin(size: 30.2, middle: 0.1902),
            child: SvgPicture.string(
              _svg_332czd,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 99.3, end: 45.8),
            Pin(size: 56.9, start: 53.0),
            child: SvgPicture.string(
              _svg_c9cj9q,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 168.0, middle: 0.9994),
            Pin(size: 70.0, end: 53.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XDiPhoneXXS11Pro1(),
                ),
              ],
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 22,
                  color: const Color(0xffa109c5),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 84.0, middle: 0.201),
            Pin(size: 14.0, start: 90.5),
            child: SvgPicture.string(
              _svg_muaczz,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 82.0, start: 51.5),
            Pin(size: 13.0, middle: 0.2468),
            child: SvgPicture.string(
              _svg_nxi5tp,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 84.0, middle: 0.201),
            Pin(size: 12.0, start: 114.5),
            child: SvgPicture.string(
              _svg_cquho5,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 81.2, start: 55.4),
            Pin(size: 13.8, middle: 0.2768),
            child: SvgPicture.string(
              _svg_hgw6vc,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          //for background in pink border
          Pinned.fromPins(
            Pin(size: 77.0, middle: 0.1963),
            Pin(size: 14.0, middle: 0.3024),
            child: SvgPicture.string(
              _svg_se76gw,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 455.0, end: 86.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 3.0, color: const Color(0xffa109c5)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 382.0, start: 21.0),
            Pin(size: 420.0, start: 360.5893),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: "Enter name",
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Color(0xffa109c5)),
                        prefixIcon: Icon(Icons.person,
                            size: 25, color: Color(0xffa109c5)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                    validator: (val) => val.isEmpty ? 'Enter name' : null,
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: "Enter Email",
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Color(0xffa109c5)),
                        prefixIcon: Icon(Icons.email,
                            size: 25, color: Color(0xffa109c5)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                    validator: (val) => val.isEmpty ? 'Enter Email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(
                    height: 15,
                    width: 230,
                  ),
                  TextFormField(
                    cursorWidth: 1,
                    decoration: textInputDecoration.copyWith(
                        hintText: "Enter Password",
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Color(0xffa109c5)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        prefixIcon: Icon(Icons.lock,
                            size: 25, color: Color(0xffa109c5)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _toggleVisibility();
                          },
                          icon: _isHidden
                              ? Icon(Icons.visibility_off,
                                  color: Color(0xffa109c5))
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.orange,
                                ),
                        )),
                    obscureText: _isHidden,
                    validator: (val) => val.length < 6
                        ? 'Enter a Password 6+ chars long more'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          groupValue: _isRadio ? false : true,
                          value: false,
                          title: Text(
                            "I accept all Terms & Conditions",
                            style: TextStyle(
                              fontFamily: 'Constantia',
                              fontSize: 14,
                              color: Color(0xffa109c5),
                            ),
                          ),
                          activeColor: const Color(0xffa109c5),
                          onChanged: (val) {
                            setState(() => _isRadio = !_isRadio);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result =
                            await _auth.registerUser(name, email, password);
                        var fuser = await FirebaseAuth.instance.currentUser;

                        if (result == null) {
                          setState(() {
                            loading = false;
                            Navigator.of(context).pop();
                          });
                        } else if (result != null) {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(fuser.uid)
                              .set({
                            'name': name,
                            'email': email,
                            "uid": fuser.uid,
                            "password": password,
                            "photourl": fuser.photoURL,
                            "timestamp": timestamp,
                            "country": "",
                            "state": " ",
                            "district": " ",
                            "block": " ",
                            "village": " ",
                            " pincode": " "
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => XDmainpage()
                                  //  d_home(currentId: fuser.uid,)
                                  ));
                        }
                      }
                    },
                    child: Container(
                      height: 45,
                      width: 180,
                      padding: const EdgeInsets.only(top: 7, left: 35),
                      decoration: BoxDecoration(
                          //color: Color(0xf2ffdbc9),
                          color: const Color(0xffa109c5),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 6,
                            child: Text(
                              'I already create account?',
                              style: TextStyle(
                                fontFamily: 'Constantia',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            )),
                        Expanded(
                          flex: 4,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => XDiPhoneXXS11Pro1()
                                  //examp()
                                  //XDmainpage(
                                  //  d_home(currentId: prefs.getString('uid'),)
                                  ));
                            },
                            child: Container(
                              width: 150.0,
                              height: 45.0,
                              padding: const EdgeInsets.only(top: 5, left: 40),
                              decoration: BoxDecoration(
                                // color: const Color(0xffa109c5),
                                borderRadius: BorderRadius.circular(58),
                              ),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: const Color(0xffa109c5),
                                  //Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_fandjj =
    '<svg viewBox="23.4 47.5 163.7 282.8" ><path transform="matrix(0.999848, 0.017452, -0.017452, 0.999848, 31.44, 58.11)" d="M 151.2731018066406 13.08650493621826 L -3.372722625732422 -10.51362800598145 L 6.044284343719482 269.5126342773438 L 155.4563293457031 252.7433929443359 L 151.2731018066406 13.08650493621826 Z" fill="#a109c5" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_6tbjiq =
    '<svg viewBox="185.2 38.5 176.3 288.2" ><path transform="matrix(0.999848, 0.017452, -0.017452, 0.999848, 200.98, 57.96)" d="M -11.15853118896484 16.06446075439453 L 160.1824035644531 -19.29490089416504 L 158.0814666748047 265.9900207519531 L -7.028257846832275 252.6877288818359 L -11.15853118896484 16.06446075439453 Z" fill="#a109c5" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9kdzln =
    '<svg viewBox="36.4 53.0 316.3 265.6" ><path transform="matrix(-0.999391, -0.034899, 0.034899, -0.999391, 344.05, 326.07)" d="M 0.5396170616149902 16.00219535827637 L 158.7525634765625 21.76403999328613 L 297.660888671875 7.481131553649902 L 308.1426086425781 253.9850463867188 L 159.8710632324219 235.1720275878906 L 11.02130794525146 262.506103515625 L 0.5396170616149902 16.00219535827637 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mzie4c =
    '<svg viewBox="228.1 69.5 93.4 100.5" ><path transform="translate(228.1, 69.53)" d="M 46.70220947265625 0 C 72.49512481689453 0 93.4044189453125 22.50382041931152 93.4044189453125 50.26368713378906 C 93.4044189453125 65.83697509765625 86.16004943847656 76.96969604492188 75.65757751464844 86.34100341796875 C 67.74343872070313 93.40404510498047 58.02529907226563 100.5273742675781 46.70220947265625 100.5273742675781 C 31.63914680480957 100.5273742675781 12.1746711730957 80.27803039550781 12.1746711730957 80.27803039550781 C 12.1746711730957 80.27803039550781 0 61.81179046630859 0 50.26368713378906 C 0 22.50382041931152 20.90929412841797 0 46.70220947265625 0 Z" fill="#f9cb96" stroke="#f9cb96" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aau26g =
    '<svg viewBox="242.4 136.5 33.5 12.5" ><path transform="translate(243.64, 134.98)" d="M 15 6.296547889709473 C 23.28427124023438 6.296547889709473 32.27650451660156 -1.47519326210022 32.27650451660156 2.761136293411255 C 32.27650451660156 6.997466087341309 23.28427124023438 13.96710205078125 15 13.96710205078125 C 6.715729713439941 13.96710205078125 -1.248886108398438 6.997466087341309 -1.248886108398438 2.761136293411255 C -1.248886108398438 -1.47519326210022 6.715729713439941 6.296547889709473 15 6.296547889709473 Z" fill="#ffffff" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_np1rsp =
    '<svg viewBox="286.5 109.5 41.0 2.0" ><path transform="translate(286.5, 109.5)" d="M 0 2 L 41 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nrc8wz =
    '<svg viewBox="228.3 170.1 93.2 108.1" ><path transform="translate(240.57, 194.06)" d="M -3.753889560699463 -6.936073303222656 C 15.29985809326172 -29.6879768371582 53.40736389160156 -29.6879768371582 72.46111297607422 -6.936073303222656 C 91.51486206054688 15.81582736968994 72.46111297607422 84.071533203125 72.46111297607422 84.071533203125 L -3.753889560699463 84.071533203125 C -3.753889560699463 84.071533203125 -22.80764007568359 15.81582736968994 -3.753889560699463 -6.936073303222656 Z" fill="#a109c5" stroke="#a109c5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_6mcjl0 =
    '<svg viewBox="261.5 223.5 14.5 11.1" ><path transform="matrix(-0.999391, -0.034899, 0.034899, -0.999391, 275.55, 234.65)" d="M 7.052175045013428 0 L 14.10435104370117 10.64609336853027 L 0 10.64609336853027 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_332czd =
    '<svg viewBox="245.2 159.8 41.9 30.2" ><path transform="matrix(0.965926, 0.258819, -0.258819, 0.965926, 247.77, 161.11)" d="M 22.5 9.39202880859375 C 34.92640686035156 9.39202880859375 32.3988037109375 -5.799270629882813 38.38330078125 -1.195846557617188 C 44.3677978515625 3.407577514648438 34.92640686035156 19.05921936035156 22.5 19.05921936035156 C 10.07359409332275 19.05921936035156 2.4765625 7.27357006072998 2.4765625 3.407577514648438 C 2.4765625 -0.4584152698516846 10.07359409332275 9.39202880859375 22.5 9.39202880859375 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c9cj9q =
    '<svg viewBox="229.8 53.0 99.3 56.9" ><path transform="matrix(0.978148, 0.207912, -0.207912, 0.978148, 229.44, 51.19)" d="M 55.14452362060547 0 C 85.94147491455078 0 101.9512252807617 28.32646179199219 101.9512252807617 36.61606216430664 C 101.9512252807617 44.90566635131836 85.79320526123047 19.4867992401123 54.99624633789063 19.4867992401123 C 24.19929313659668 19.4867992401123 8.544610023498535 43.1318473815918 8.544610023498535 34.84224319458008 C 8.544610023498535 26.55264663696289 24.34756469726563 0 55.14452362060547 0 Z" fill="#707070" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_muaczz =
    '<svg viewBox="58.5 90.5 84.0 14.0" ><path transform="translate(58.5, 90.5)" d="M 84 14 L 0 0" fill="none" stroke="#a109c5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nxi5tp =
    '<svg viewBox="51.5 211.5 82.0 13.0" ><path transform="translate(51.5, 211.5)" d="M 82 13 L 0 0" fill="none" stroke="#a109c5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cquho5 =
    '<svg viewBox="58.5 114.5 84.0 12.0" ><path transform="translate(58.5, 114.5)" d="M 84 12 L 0 0" fill="none" stroke="#a109c5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hgw6vc =
    '<svg viewBox="55.4 237.0 81.2 13.8" ><path transform="translate(55.41, 236.98)" d="M 81.20355224609375 13.84797668457031 L 0 0" fill="none" stroke="#a109c5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_se76gw =
    '<svg viewBox="58.5 258.8 77.0 14.0" ><path transform="translate(58.5, 258.83)" d="M 0 0 L 77 14" fill="none" stroke="#a109c5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rnuy1v =
    '<svg viewBox="222.5 101.5 12.0 10.0" ><path transform="translate(222.5, 101.5)" d="M 12 10 L 0 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
