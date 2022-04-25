import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proddeccec/Screen/chat/helperFunctions/sharedpref_helper.dart';
import 'package:proddeccec/Screen/chat/services/database.dart';
import 'package:proddeccec/backend/size_config.dart';
import 'package:random_string/random_string.dart';

class Chatscreen extends StatefulWidget {
  final String chatWithUsername, name;
  Chatscreen(this.chatWithUsername, this.name);
  @override
  _ChatscreenState createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  String chatRoomId, messageId = "";
  Stream messageStream;
  String myName, myProfilePic, myUserName, myEmail;
  TextEditingController messageTextEdittingController = TextEditingController();

  getMyInfoFromSharedPreference() async {
    myName = await SharedPreferenceHelper().getDisplayName();
    myProfilePic = await SharedPreferenceHelper().getUserProfileUrl();
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();

    chatRoomId = getChatRoomIdByUsernames(myUserName, widget.chatWithUsername);
  }

  getChatRoomIdByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  addMessage(bool sendClicked) {
    if (messageTextEdittingController.text != "") {
      String message = messageTextEdittingController.text;

      var lastMessageTs = DateTime.now();
      Map<String, dynamic> messageInfoMap = {
        "message": message,
        "sendBy": myUserName,
        "ts": lastMessageTs,
        "imgUrl": myProfilePic
      };

      if (messageId == "") {
        messageId = randomAlphaNumeric(12);
      }

      DatabaseMethods()
          .addMessage(chatRoomId, messageId, messageInfoMap)
          .then((value) {
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": message,
          "lastMessageSendTs": lastMessageTs,
          "lastMessageSendBy": myUserName
        };

        DatabaseMethods().updateLastMessageSend(chatRoomId, lastMessageInfoMap);

        if (sendClicked) {
          //remove the text in the mmessage input field
          messageTextEdittingController.text = "";
          // make messageid blank to get regenerated on next message send

          messageId = "";
        }
      });
    }
  }

  Widget chatMessageTile(String message,bool sendByMe) {
    return Row(
      mainAxisAlignment: sendByMe? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              bottomRight: sendByMe ? Radius.circular(0) : Radius.circular(24),
              topRight: Radius.circular(24),
              bottomLeft: sendByMe ? Radius.circular(24) : Radius.circular(0),
            ),
            color: Color.fromRGBO(48, 25, 52,100),
          ),
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),

          padding: EdgeInsets.all(16),
          child: Text(message,style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }

  Widget chatMessages() {
    return StreamBuilder(
      stream: messageStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 10,top: SizeConfig.safeBlockHorizontal * 4),
                itemCount: snapshot.data.docs.length,
                reverse: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return chatMessageTile(ds["message"],myUserName== ds["sendBy"]);
                })
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  getAndSetMessages() async {
    messageStream = await DatabaseMethods().getChatRoomMessages(chatRoomId);
    setState(() {});
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreference();
    getAndSetMessages();
  }

  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Color.fromRGBO(48, 25, 52,50),
      ),
      body: Container(
        color: Color.fromRGBO(255, 165, 133, 100),
        child: Stack(
          children: [
            chatMessages(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "type a message",
                          hintStyle: TextStyle(color: Colors.white)),
                      controller: messageTextEdittingController,
                      onChanged: (value) {
                        addMessage(false);
                      },
                    )),
                    GestureDetector(
                      onTap: () {
                        addMessage(true);
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
