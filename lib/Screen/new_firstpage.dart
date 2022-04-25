import 'package:flutter/material.dart';
import 'package:proddeccec/Screen/chat/services/auth.dart';
import 'package:proddeccec/Screen/chat/views/home.dart';
import 'package:proddeccec/Screen/chat/views/sigin.dart';
import 'package:proddeccec/Screen/new_Forum.dart';
import 'package:proddeccec/Screen/department.dart';
//import 'package:proddeccec/Screen/proddec.dart';
import 'package:proddeccec/Screen/notification/notification.dart';
import 'package:proddeccec/backend/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;
final FirebaseMessaging _fcm = FirebaseMessaging.instance;

class New_firstPage extends StatefulWidget {
  @override
  _New_firstPageState createState() => _New_firstPageState();
}

class _New_firstPageState extends State<New_firstPage> {
  _saveDeviceToken() async {
    // Get the token for this device
    String fcmToken = await _fcm.getToken();

    // Save it to Firestore
    if (fcmToken != null) {
      var tokens = _db.collection('users').doc(fcmToken);

      await tokens.set({
        'token': fcmToken,
      });
    }
  }

  String Cec = '''College of Engineering  Chengannur''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/cec 3.png"), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 5.5,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.138,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Image(image: AssetImage("images/cec 4.png")),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            Cec,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(200, 26, 27, 1)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.593,
            left: SizeConfig.safeBlockVertical * 3.2,
            child: Row(
              children: [
                FlatButton(
                    highlightColor: Colors.blue[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 1.0)),
                    splashColor: Colors.black,
                    color: Colors.white,
                    minWidth: MediaQuery.of(context).size.width * 0.415,
                    height:  MediaQuery.of(context).size.height* .09,
                    onPressed: () {
                      _saveDeviceToken();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Notify()),
                      );
                    },
                    child: Text(
                      "   Notice   ",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                      ),
                    )),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 7.2,
                ),
                FlatButton(
                    highlightColor: Colors.blue[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 1.0)),
                    splashColor: Colors.black,
                    color: Colors.white,
                    minWidth: MediaQuery.of(context).size.width * 0.415,
                    height:  MediaQuery.of(context).size.height* .09,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Department(),
                          ));
                    },
                    child: Text(
                      "STAFF DIRECTORY",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                      ),
                    )),
              ],
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * .734,
            left: SizeConfig.safeBlockVertical * 3.2,
              child: Row(
                children: [
                  FlatButton(
                      highlightColor: Colors.blue[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.black, width: 1.0)),
                      splashColor: Colors.black,
                      color: Colors.white,
                      minWidth: MediaQuery.of(context).size.width * 0.415,
                      height:  MediaQuery.of(context).size.height* .09,
                      onPressed: () {
                        _saveDeviceToken();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => new_Forum()),
                        );
                      },
                      child: Text(
                        "   FORUM   ",
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                        ),
                      )),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 7.2,
                  ),
                  FlatButton(
                      highlightColor: Colors.blue[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.black, width: 1.0)),
                      splashColor: Colors.black,
                      color: Colors.white,
                      minWidth: MediaQuery.of(context).size.width * 0.415,
                      height:  MediaQuery.of(context).size.height* .09,
                      onPressed: () {

                      },
                      child: Text(
                        "PROJECTS",
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      )),
                ],
              ),),

          Positioned(
            top: MediaQuery.of(context).size.height * .85,
            left: SizeConfig.safeBlockVertical * 18,
            child: Row(
              children: [
                FlatButton(
                    highlightColor: Colors.blue[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 1.0)),
                    splashColor: Colors.black,
                    color: Colors.white,
                    minWidth: MediaQuery.of(context).size.width * 0.415,
                    height:  MediaQuery.of(context).size.height* .09,
                    onPressed: () {
                      _saveDeviceToken();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FutureBuilder(
                          future: AuthMethods().getCurrentUser(),
                            builder: (context, AsyncSnapshot<dynamic> snapshot){
                            if(snapshot.hasData){
                              return Home();
                            }else{
                              return SignIn();
                            }
                            }
                        )),
                      );
                    },
                    child: Text(
                      "   CEC-Connect   ",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                      ),
                    )),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 7.2,
                ),
              ],
            ),)
        ],
      ),
    );
  }
}
