import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proddeccec/Screen/notification/login.dart';
import 'package:proddeccec/backend/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notice',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.w700,
            fontSize: SizeConfig.safeBlockHorizontal * 4.5,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
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
          //back button colour
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *.035),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('eNotification')
                .snapshots(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: new Text('Loading....',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0)));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot myNotify = snapshot.data.docs[index];

                      _launchURL1() async {
                        final url = myNotify.data()['link1'];
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }

                      _launchURL2() async {
                        final url = myNotify.data()['link2'];
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }

                      _launchURL3() async {
                        final url = myNotify.data()['link3'];
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }


                      return Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        margin: EdgeInsets.all(10.0),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 4.0,
                          child: Column(
                            children: <Widget>[

                              Container(
                                width: MediaQuery.of(context).size.width,
                                color: getColor(),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height * .01),
                                  child: Text(
                                    myNotify.data()['title'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                      SizeConfig.safeBlockHorizontal * 4.5,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * .01),
                                child: Center(
                                  child: Text(
                                    myNotify.data()['details'],
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueGrey,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .017,
                                    ),
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      FlatButton(
                                          onPressed: _launchURL1,
                                          child: Text(
                                            myNotify.data()['button1'],
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.w700,
                                              color: Colors.blue,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .020,
                                            ),
                                          )),
                                      FlatButton(
                                          onPressed: _launchURL2,
                                          child: Text(
                                            myNotify.data()['button2'],
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.w700,
                                              color: Colors.blue,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .020,
                                            ),
                                          )),
                                      FlatButton(
                                          onPressed: _launchURL3,
                                          child: Text(
                                            myNotify.data()['button3'],
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.w700,
                                              color: Colors.blue,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .020,
                                            ),
                                          )),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
int i=0;
Color getColor(){
  if (i== 0){
    i++;
    return Color.fromRGBO(254, 253, 202, 1);

  }if(i==1){
    i++;
    return Color.fromRGBO(255, 207, 223, 1);
  }
  if(i==2){
    i++;
    return Color.fromRGBO(255, 207, 223, 1);
  }
  if(i==3){
    i=0;
    return Color.fromRGBO(224, 249, 181, 1);
  }

}


// Developed by Arjun Vishnu Varma.
// Date: August 2020.
// Contact: arjun.varma9@gmail.com
// On behalf: PRODDEC CEC @ 2020