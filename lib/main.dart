import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

BuildContext context;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            child: LoginPage(),
          ),
        ),
      ),
    );
  }
}

setVisitingFlag() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("alreadyVisited", true);
}

getVisitingFlag() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool alreadyVisited = preferences.getBool("alreadyVisited") ?? false;
  return alreadyVisited;
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _page = 0;
  var _background = Colors.black;
  var _title = Colors.white;
  double _width = 0;
  double _height = 0;
  double _shutter1height = 0;
  double _shutter2height = 0;
  double _shutter1offset = 0;
  double _shutter1width = 0;
  double _shutter2width = 0;
  double _opacityshutter1 = 1;
  double _varmargin = 100;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _varmargin = MediaQuery.of(context).size.width;
    if (_page == 0) {
      _background = Colors.black;
      _title = Colors.white;
      _shutter1height = _height;
      _shutter2height = _height;
      _shutter1offset = MediaQuery.of(context).size.width * 0.0;
      _shutter1width = _width;
      _opacityshutter1 = 1;
      _varmargin = MediaQuery.of(context).size.width * 0.1;
      _shutter2width = _width;
    } else if (_page == 1) {
      _background = Colors.black;
      _title = Colors.white;
      _shutter1height = MediaQuery.of(context).size.width * 0.4;
      _shutter1offset = MediaQuery.of(context).size.width * 0.0;
      _shutter2height = _height;
      _shutter1width = _width;
      _opacityshutter1 = 1;
      _varmargin = MediaQuery.of(context).size.width * 0.06;
      _shutter2width = _width;
    } else {
      _background = Colors.black;
      _title = Colors.white;
      _shutter1height = MediaQuery.of(context).size.width * 0.4;
      _shutter2height = MediaQuery.of(context).size.width * 0.45;
      _shutter1offset = MediaQuery.of(context).size.width * 0.05;
      _shutter1width = _width - MediaQuery.of(context).size.width * 0.1;
      _shutter2width = _width;
      _opacityshutter1 = 0.6;
      _varmargin = MediaQuery.of(context).size.width * 0.06;
    }

    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              _page = 0;
            });
          },
          child: AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000,
            ),
            color: _background,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: Duration(
                        milliseconds: 1000,
                      ),
                      margin: EdgeInsets.all(_varmargin),
                      child: Column(
                        children: <Widget>[
                          AnimatedContainer(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(
                              milliseconds: 1000,
                            ),
                            child: Text(
                              "App Name",
                              style: GoogleFonts.roboto(
                                letterSpacing: 2.0,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.08,
                                color: _title,
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(
                              milliseconds: 1000,
                            ),
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.fromLTRB(
                                _varmargin, _varmargin, _varmargin, 0.0),
                            child: Text(
                              "This app was created for all the user to track their expenses",
                              style: GoogleFonts.sourceSansPro(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: _title,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 6,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.06),
                      width: double.infinity,
                      color: Colors.white,
                      child: Text(
                        "Image to be Displayed",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    flex: 6,
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.14),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _page = 1;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.01),
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.circular(50)),
                            child: Center(
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.roboto(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    flex: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedContainer(
          alignment: Alignment.center,
          width: _shutter1width,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(_opacityshutter1),
            borderRadius: BorderRadius.only(
              topLeft:
                  Radius.circular(MediaQuery.of(context).size.width * 0.07),
              topRight:
                  Radius.circular(MediaQuery.of(context).size.width * 0.07),
            ),
          ),
          transform: Matrix4.translationValues(_shutter1offset, _shutter1height,
              MediaQuery.of(context).size.width * 0.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Login to Continue",
                  style: GoogleFonts.roboto(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Text(
                  "Email",
                  style: GoogleFonts.roboto(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black12,
                    ),
                    cursorColor: Color(0xffFC2E7E),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      hintText: "Enter Email",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Color(0xffFC2E7E),
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Text(
                  "Password",
                  style: GoogleFonts.roboto(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black12,
                    ),
                    cursorColor: Color(0xffFC2E7E),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Color(0xffFC2E7E),
                          )),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  bool visitingFlag = await getVisitingFlag();
                  setVisitingFlag();
                  if (visitingFlag == true) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=> //ToDo:HomeScreen,
                    ));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> LoginPage(),
                    ));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Text(
                    "Keep Me Signed In",
                    style: GoogleFonts.roboto(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              EmailButton(
                buttonText: "Login",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _page = 2;
                  });
                },
                child: NewAccountButton(
                  buttontext1: "Create New Account",
                ),
              )
            ],
          ),
        ),
        AnimatedContainer(
          alignment: Alignment.center,
          width: _shutter2width,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft:
                  Radius.circular(MediaQuery.of(context).size.width * 0.07),
              topRight:
                  Radius.circular(MediaQuery.of(context).size.width * 0.07),
            ),
          ),
          transform: Matrix4.translationValues(
              0.0, _shutter2height, MediaQuery.of(context).size.width * 0.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Create a New Account",
                  style: GoogleFonts.roboto(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Text(
                  "Full Name",
                  style: GoogleFonts.roboto(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black12,
                    ),
                    cursorColor: Color(0xffFC2E7E),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      hintText: "Enter your Full Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Color(0xffFC2E7E),
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Text(
                  "Email",
                  style: GoogleFonts.roboto(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black12,
                    ),
                    cursorColor: Color(0xffFC2E7E),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      hintText: "Enter Email",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Color(0xffFC2E7E),
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Text(
                  "Password",
                  style: GoogleFonts.roboto(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black12,
                    ),
                    cursorColor: Color(0xffFC2E7E),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Color(0xffFC2E7E),
                          )),
                    ),
                  ),
                ),
              ),
              EmailButton(
                buttonText: "Sign Up",
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _page = 1;
                  });
                },
                child: NewAccountButton(
                  buttontext1: "Back to Login Page",
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class EmailButton extends StatefulWidget {
  final String buttonText;
  EmailButton({this.buttonText});
  @override
  _EmailButtonState createState() => _EmailButtonState();
}

class _EmailButtonState extends State<EmailButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.height * 0.03,
          MediaQuery.of(context).size.height * 0.03,
          MediaQuery.of(context).size.height * 0.03,
          MediaQuery.of(context).size.height * 0.015),
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadiusDirectional.circular(50),
      ),
      child: Text(
        widget.buttonText,
        style: GoogleFonts.roboto(
          fontSize: MediaQuery.of(context).size.width * 0.06,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class NewAccountButton extends StatefulWidget {
  final String buttontext1;
  NewAccountButton({this.buttontext1});
  @override
  _NewAccountButtonState createState() => _NewAccountButtonState();
}

class _NewAccountButtonState extends State<NewAccountButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.height * 0.03,
          MediaQuery.of(context).size.height * 0.03,
          MediaQuery.of(context).size.height * 0.03,
          MediaQuery.of(context).size.height * 0.015),
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadiusDirectional.circular(50),
      ),
      child: Text(
        widget.buttontext1,
        style: GoogleFonts.roboto(
          fontSize: MediaQuery.of(context).size.width * 0.06,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
