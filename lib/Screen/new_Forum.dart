import 'package:flutter/material.dart';
import 'package:proddeccec/Screen/forum/addEvent/iedc/iedc.dart';
import 'package:proddeccec/Screen/forum/addEvent/ieee/ieee.dart';
//import 'package:proddeccec/Screen/forum/addEvent/ncc/ncc.dart';
import 'package:proddeccec/Screen/forum/addEvent/nss/nss.dart';
//import 'package:proddeccec/Screen/forum/addEvent/exess/exess.dart';
import 'package:proddeccec/Screen/forum/addEvent/arc/arc.dart';
import 'package:proddeccec/Screen/forum/addEvent/foces/foces.dart';
import 'package:proddeccec/Screen/forum/addEvent/surge/surge.dart';
import 'package:proddeccec/Screen/forum/addEvent/proddec/proddec.dart';
import 'package:proddeccec/Screen/forum/addEvent/tinkerhub/tinkerhub.dart';
import 'package:proddeccec/backend/size_config.dart';
//import 'package:url_launcher/link.dart';

class new_Forum extends StatefulWidget {
  @override
  _new_ForumState createState() => _new_ForumState();
}

class _new_ForumState extends State<new_Forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forums',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: SizeConfig.safeBlockVertical * 3,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: SizeConfig.safeBlockVertical * 3.5,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.safeBlockVertical * 1.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Forum_Adds(
                    image: 'images/logo.png',
                    text: "PRODDEC",
                    link: Event1(),
                  ),
                  Forum_Adds(
                    image: 'images/Ieee.png',
                    text: "IEEE",
                    link: Event4(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Forum_Adds(
                    image: 'images/iedc.png',
                    text: "IEDC",
                    link: Event5(),
                  ),
                  Forum_Adds(
                    image: 'images/Nss.png',
                    text: "NSS",
                    link: Event2(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Forum_Adds(
                    image: 'images/tinkerhub.png',
                    text: "TINKERHUB",
                    link: Event10(),
                  ),
                  Forum_Adds(
                    image: 'images/arc.png',
                    text: "ARC",
                    link: Event7(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Forum_Adds(
                    image: 'images/foces.png',
                    text: "FOCES",
                    link: Event6(),
                  ),
                  Forum_Adds(
                    image: 'images/surge1.png',
                    text: "SURGE",
                    link: Event9(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Forum_Adds extends StatelessWidget {
  const Forum_Adds({Key key, this.image, this.text, this.link})
      : super(key: key);
  final String image, text;
  final Widget link;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => link),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * .3,
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.width * .3,
                width: MediaQuery.of(context).size.height * .137,
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.fitWidth,
                )),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 1.5,
            ),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * .45,
                height: SizeConfig.safeBlockVertical * 3.5,
                color: Color.fromRGBO(165, 222, 229, 0.8),
                child: Text(
                  text,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.safeBlockVertical * 2.9),
                )),
          ],
        ),
      ),
    );
  }
}
