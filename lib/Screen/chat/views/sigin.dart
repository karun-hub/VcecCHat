import 'package:flutter/material.dart';
import 'package:proddeccec/Screen/chat/services/auth.dart';
import 'package:proddeccec/backend/size_config.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 25, 52,50),
        title: Text(
          "CEC-Connect "
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/signinbackground.png"),fit: BoxFit.fitWidth
          )
        ),
        child: Center(
          child: GestureDetector(
            onTap: (){
              AuthMethods().sigInWithGoogle(context);
            },
            child: Container(
              height: MediaQuery.of(context).size.height*.08,
              width: MediaQuery.of(context).size.width*.6,
              color: Colors.white,
padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4.5),
              child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: SizeConfig.safeBlockHorizontal * 10.5,
                      child: Image(image: AssetImage("images/google.png"))),
                  Text("SignIn With Google",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4.5,fontWeight: FontWeight.bold),),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
