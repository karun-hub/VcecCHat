import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proddeccec/Screen/chat/helperFunctions/sharedpref_helper.dart';
import 'package:proddeccec/Screen/chat/services/auth.dart';
import 'package:proddeccec/Screen/chat/services/database.dart';
import 'package:proddeccec/Screen/chat/views/chatscreen.dart';
import 'package:proddeccec/Screen/chat/views/sigin.dart';
import 'package:proddeccec/backend/size_config.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSearching = false;
  String myName, myProfilePic, myUserName, myEmail;
  Stream usersStream, chatRoomsStream;

  TextEditingController searchUsernameEditingController =
  TextEditingController();

  getMyInfoFromSharedPreference() async {
    myName = await SharedPreferenceHelper().getDisplayName();
    myProfilePic = await SharedPreferenceHelper().getUserProfileUrl();
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    setState(() {});
  }

  getChatRoomIdByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  onSearchBtnClick() async {
    isSearching = true;
    setState(() {});
    usersStream = await DatabaseMethods()
        .getUserByUserName(searchUsernameEditingController.text);

    setState(() {});
  }

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRoomsStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];
              return ChatRoomListTile(ds["lastMessage"], ds.id, myUserName);
            })
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget searchListUserTile({String profileUrl, name, username, email}) {
    return GestureDetector(
      onTap: () {
        var chatRoomId = getChatRoomIdByUsernames(myUserName, username);
        Map<String, dynamic> chatRoomInfoMap = {
          "users": [myUserName, username]
        };
        DatabaseMethods().createChatRoom(chatRoomId, chatRoomInfoMap);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Chatscreen(username, name)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                profileUrl,
                height: 40,
                width: 40,
              ),
            ),
            SizedBox(width: 12),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(name), Text(email)])
          ],
        ),
      ),
    );
  }

  Widget searchUsersList() {
    return StreamBuilder(
      stream: usersStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return searchListUserTile(
                profileUrl: ds["imgUrl"],
                name: ds["name"],
                email: ds["email"],
                username: ds["username"]);
          },
        )
            : Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  getChatRooms() async {
    chatRoomsStream = await DatabaseMethods().getChatRooms();
    setState(() {

    });
  }

  onScreenLoaded() async {
    await getMyInfoFromSharedPreference();
    getChatRooms();
  }

  @override
  void initState() {
    onScreenLoaded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 25, 52,50),
        title: Text("CEC-Connect "),
        actions: [
          InkWell(
            onTap: () {
              AuthMethods().signOut().then((s) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              });
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Container(
        color: Color.fromRGBO(255, 165, 133, 100),
        child: Container(

          margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4.5),
          child: Column(
            children: [
              Row(
                children: [
                  isSearching
                      ? GestureDetector(
                    onTap: () {
                      isSearching = false;
                      searchUsernameEditingController.text = "";
                      setState(() {});
                    },
                    child: Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(Icons.arrow_back)),
                  )
                      : Container(),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey[100],
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(24),
                        color: Colors.white
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                                controller: searchUsernameEditingController,
                                decoration: InputDecoration(
                                    border: InputBorder.none, hintText: "username"),
                              )),
                          GestureDetector(
                              onTap: () {
                                if (searchUsernameEditingController.text != "") {
                                  onSearchBtnClick();
                                }
                              },
                              child: Icon(Icons.search))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              isSearching ? searchUsersList() : chatRoomsList()
            ],
          ),
        ),
      ),
    );
  }
}

class ChatRoomListTile extends StatefulWidget {
  final String lastMessage, chatRoomId, myUsername;
  ChatRoomListTile(this.lastMessage, this.chatRoomId, this.myUsername);


  @override
  _ChatRoomListTileState createState() => _ChatRoomListTileState();
}

class _ChatRoomListTileState extends State<ChatRoomListTile> {
  String profilePicUrl = "", name = "", username = "";

getThisUserInfo()async{
  username= widget.chatRoomId.replaceAll(widget.myUsername, "").replaceAll("_", "");
  QuerySnapshot querySnapshot = await DatabaseMethods().getUserInfo(username);
  print("something ${querySnapshot.docs[0].id}");
  name = "${querySnapshot.docs[0]["name"]}";
  profilePicUrl = "${querySnapshot.docs[0]["imgUrl"]}";
  setState(() {

  });
}

  @override
  void initState() {
    getThisUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Chatscreen(username, name)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                profilePicUrl,
                height: 40,
                width: 40,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4,fontWeight: FontWeight.bold,fontFamily: 'OpenSans'),
                ),
                SizedBox(height: 3),
                Text(widget.lastMessage)
              ],
            )
          ],
        ),
      ),
    );
  }
}
