import 'package:flutter/material.dart';
import 'package:proddeccec/Screen/Forum.dart';
import 'package:proddeccec/Screen/department.dart';
//import 'package:proddeccec/Screen/proddec.dart';
import 'package:proddeccec/Screen/notification/notification.dart';
import 'package:proddeccec/backend/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;
final FirebaseMessaging _fcm = FirebaseMessaging.instance;

//FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Firstpage').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: new Text('Welcome'));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot first = snapshot.data.docs[index];
                      _launchURL1() async {
                        final url = first.data()['link1'];
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      }

                      _launchURL2() async {
                        final url = first.data()['link2'];
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      }

                      _launchURL3() async {
                        final url = first.data()['link3'];
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      }

                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: ListView(
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            GestureDetector(
                              onTap: _launchURL1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                .1),
                                    height: MediaQuery.of(context).size.height *
                                        .26,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/cec1.jpg"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .013,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Container(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * .024),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .48,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .076,
                                      margin: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              .024),
                                      child: RaisedButton(
                                          elevation: 1.2,
                                          color: Colors.white,
                                          highlightColor: Colors.blue[300],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          splashColor: Colors.black,
                                          onPressed: () {
                                            _saveDeviceToken();

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Notify()),
                                            );
                                          },
                                          child: Text(
                                            "NOTICE",
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  4.6,
                                            ),
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .024),
                                      width: MediaQuery.of(context).size.width *
                                          .48,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .076,
                                      child: RaisedButton(
                                          elevation: 1.2,
                                          color: Colors.white,
                                          highlightColor: Colors.blue[300],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          splashColor: Colors.black,
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
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  4.6,
                                            ),
                                          )),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .48,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .076,
                                      child: RaisedButton(
                                          elevation: 1.2,
                                          color: Colors.white,
                                          highlightColor: Colors.blue[300],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          splashColor: Colors.black,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Forum(),
                                                ));
                                          },
                                          child: Text(
                                            "FORUM",
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  4.6,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .00),
                                    width:
                                        MediaQuery.of(context).size.width * .48,
                                    height: MediaQuery.of(context).size.height *
                                        .076,
                                    child: RaisedButton(
                                      elevation: 1.2,
                                      color: Colors.white,
                                      onPressed: _launchURL3,
                                      highlightColor: Colors.blue[300],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      splashColor: Colors.black,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .03,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .03),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage("images/moodle.png"),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      );
                    });
              }
            }));
  }
}
