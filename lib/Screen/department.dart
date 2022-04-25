import 'package:flutter/material.dart';
import 'package:proddeccec/backend/size_config.dart';
import 'staffDirectory/aeDepartmentStaff.dart';
import 'staffDirectory/csDepartmentStaff.dart';

import 'staffDirectory/ecDepartmentStaff.dart';
import 'staffDirectory/eeDepartmentStaff.dart';
import 'staffDirectory/geDepartmentStaff.dart';

class Department extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DEPARTMENTS',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: SizeConfig.safeBlockHorizontal * 5.8,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Padding(padding: EdgeInsets.only(top: )),
              /*AppBar(
                  title: Center(
                      child: Text(
                    'Departments',
                    style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),
                  )),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white,
                ),*/
              SizedBox(height: MediaQuery.of(context).size.height * 0.023),
              Card(
                elevation: 0,
                margin: new EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.045,
                    vertical: MediaQuery.of(context).size.height * 0.030),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.060,
                      child: ListTile(
                        tileColor: Color.fromRGBO(165, 222, 229, 0.8),
                        title: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 6, top: 0),
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.057,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CSDepartment()),
                                  );
                                },
                                child: Text(
                                  'Computer Science Engineering',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 4.8,
                                      fontFamily: 'OpenSans'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 6,
                          fit: FlexFit.tight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.057,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 1.3,
                              child: Text(
                                'HoD : Dr Smitha Dharan',
                                style: TextStyle(
                                  fontSize:
                                  SizeConfig.safeBlockHorizontal * 2.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CSDepartment()),
                                );
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.057,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 1.3,
                              child: Text(
                                'Faculty',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CSDepartment()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                margin: new EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.045,
                    vertical: MediaQuery.of(context).size.height * 0.020),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.060,
                      child: ListTile(
                        tileColor: Color.fromRGBO(165, 222, 229, 0.8),
                        title: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 6, top: 0),
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.057,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ECDepartment()),
                                  );
                                },
                                child: Text(
                                  'Electronics Engineering',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 4.8,
                                      fontFamily: 'OpenSans'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 6,
                          fit: FlexFit.tight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.057,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 1.3,
                              child: Text(
                                'HoD : Dr.Laila D',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ECDepartment()),
                                );
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.057,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 1.3,
                              child: Text(
                                'Faculty',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ECDepartment()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                margin: new EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.045,
                    vertical: MediaQuery.of(context).size.height * 0.030),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.060,
                      child: ListTile(
                        tileColor: Color.fromRGBO(165, 222, 229, 0.8),
                        title: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 6, top: 0),
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.057,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EEDepartment()),
                                  );
                                },
                                child: Text(
                                  'Electrical Engineering',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 4.8,
                                      fontFamily: 'OpenSans'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 6,
                          fit: FlexFit.tight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.057,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 1.3,
                              child: Text(
                                'HoD : Dr.Bindu C J',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EEDepartment()),
                                );
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.057,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 1.3,
                              child: Text(
                                'Faculty',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EEDepartment()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                margin: new EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.045,
                    vertical: MediaQuery.of(context).size.height * 0.020),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.060,
                      child: ListTile(
                        tileColor: Color.fromRGBO(165, 222, 229, 0.8),
                        title: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 6, top: 0),
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.057,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GEDepartment()),
                                  );
                                },
                                child: Text(
                                  'General Engineering',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 4.8,
                                      fontFamily: 'OpenSans'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 6,
                          fit: FlexFit.tight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.057,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 1.3,
                              child: Text(
                                'HoD : Dr.Ashok Kumar T V',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GEDepartment()),
                                );
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.057,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 1.3,
                              child: Text(
                                'Faculty',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GEDepartment()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                margin: new EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.045,
                    vertical: MediaQuery.of(context).size.height * 0.020),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.060,
                      child: ListTile(
                        tileColor: Color.fromRGBO(165, 222, 229, 0.8),
                        title: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 6, top: 0),
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.057,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AEDepartment()),
                                  );
                                },
                                child: Text(
                                  'Applied Science',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 4.6,
                                      fontFamily: 'OpenSans'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 6,
                          fit: FlexFit.tight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.057,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 1.3,
                              child: Center(
                                child: Text(
                                  'HoD : Dr.Madhusoodhanan Nair R',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 2.9,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AEDepartment()),
                                );
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.057,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 1.3,
                              child: Text(
                                'Faculty',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AEDepartment()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
