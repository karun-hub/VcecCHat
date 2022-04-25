import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:proddeccec/Screen/forum/addEvent/foces/addevent.dart';
import 'package:proddeccec/Screen/forum/addEvent/foces/login.dart';
import 'package:proddeccec/backend/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class Event6 extends StatefulWidget {
  @override
  _Event6State createState() => _Event6State();
}

class _Event6State extends State<Event6> {
  String _orderby = 'date';
  bool isDescending = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: SizeConfig.safeBlockHorizontal * 5,
            fontWeight: FontWeight.w700,
            // fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: SizeConfig.safeBlockVertical * 3,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('eFoces')
              .orderBy(_orderby, descending: true)
              .snapshots(),
          builder:
              // ignore: missing_return
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: new Text('Loading....'));
            } else if (snapshot.hasError) {
              const Text('No data avaible right now');
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot myEvent = snapshot.data.docs[index];

                    _launchURL1() async {
                      final url = myEvent.data()['link1'];
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }

                    _launchURL2() async {
                      final url = myEvent.data()['link2'];
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }

                    return Container(
                      width: MediaQuery.of(context).size.width * 9,
                      height: SizeConfig.safeBlockVertical * 30.5,
                      child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          // scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.safeBlockHorizontal * 4,
                                  right: SizeConfig.safeBlockHorizontal * 2,
                                  left: SizeConfig.safeBlockHorizontal * 2),
                              child: Card(
                                  child: Material(
                                      //borderRadius: BorderRadius.circular(26.0),
                                      //elevation: 4.0,
                                      shadowColor: Colors.grey,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    35,
                                            height:
                                                SizeConfig.safeBlockHorizontal *
                                                    40.5,
                                            child: ClipRRect(
                                              child: Image.network(
                                                myEvent.data()['image'],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: SizeConfig
                                                        .safeBlockHorizontal *
                                                    2),
                                            child: Stack(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .005,
                                                    top: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .02,
                                                  ),
                                                  child: SizedBox(
                                                    height: SizeConfig
                                                            .safeBlockVertical *
                                                        20,
                                                    width: SizeConfig
                                                            .safeBlockHorizontal *
                                                        56,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: <Widget>[
                                                          Expanded(
                                                              child: Text(
                                                            myEvent
                                                                .data()['name'],
                                                            style:
                                                                Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline3
                                                                    .merge(
                                                                      TextStyle(
                                                                        fontFamily:
                                                                            'Ubuntu',
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.height *
                                                                                .020,
                                                                      ),
                                                                    ),
                                                          )),
                                                          Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                bottom: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    .005,
                                                                top: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    .02,
                                                              ),
                                                              child: Text(
                                                                myEvent.data()[
                                                                    'details'],
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Lekton',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      .012,
                                                                ),
                                                              )),
                                                          SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Container(
                                                              child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    bottom: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .005,
                                                                    top: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        .01,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Icon(Icons
                                                                          .calendar_today),
                                                                      Text(
                                                                        myEvent.data()[
                                                                            'date'],
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          color:
                                                                              Colors.blueGrey,
                                                                          fontSize:
                                                                              MediaQuery.of(context).size.height * .021,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )),
                                                            ),
                                                          ),
                                                          SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Container(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Icon(Icons
                                                                      .link),
                                                                  FlatButton(
                                                                      onPressed:
                                                                          _launchURL1,
                                                                      child:
                                                                          Text(
                                                                        myEvent.data()[
                                                                            'button1'],
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          color:
                                                                              Colors.blue,
                                                                          fontSize:
                                                                              MediaQuery.of(context).size.height * .016,
                                                                        ),
                                                                      )),
                                                                  FlatButton(
                                                                      onPressed:
                                                                          _launchURL2,
                                                                      child:
                                                                          Text(
                                                                        myEvent.data()[
                                                                            'button2'],
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          color:
                                                                              Colors.blue,
                                                                          fontSize:
                                                                              MediaQuery.of(context).size.height * .016,
                                                                        ),
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ]),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))),
                            )
                          ]),
                    );
                  });
            }
          }),
    );
  }
}
