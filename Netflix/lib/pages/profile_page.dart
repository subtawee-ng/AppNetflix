//import 'dart:html';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone/json/profile.dart';
import 'package:netflix_clone/pages/edit_profile_page.dart';
import 'package:netflix_clone/pages/profile_user.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'mylist_page.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: getAppbar(),
      //bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppbar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Text(
        "Profile",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getBody() {
    createAlertDialog(BuildContext context, bool incorrect) {
      String currentText = "";

      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              incorrect
                  ? "Incorrect PIN. Please try again."
                  : "Enter your PIN to access this profile.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            content: Wrap(
              children: [
                PinCodeTextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  blinkWhenObscuring: true,
                  enablePinAutofill: true,
                  appContext: context,
                  keyboardType: TextInputType.number,
                  length: 4,
                  onChanged: (value) {
                    setState(() {
                      currentText = value;
                    });
                  },
                  onCompleted: (value) {
                    if (value == "1234") {
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pop();
                      createAlertDialog(context, true);
                    }
                  },
                ),
                SizedBox(
                  height: 70,
                ),
                Text("Forget PIN?", textAlign: TextAlign.center),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"))
            ],
          );
        },
      );
    }

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                profileData.length,
                (index) => GestureDetector(
                  onTap: () {
                    createAlertDialog(context, false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        image: AssetImage(
                          profileData[index]["img"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    //child: Text("test"),
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                profileData.length,
                (index) => Container(
                  decoration: BoxDecoration(
                    //color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      profileData[index]["name"],
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProfileUserPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    child: Text(
                      "Edit profile",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // ListView(
            //   children: List.generate(
            //     4,
            //     (index) => Container(
            //       width: 50,
            //       height: 50,
            //       color: Colors.green,
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MylistPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 19,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      child: Text(
                        "My List",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          //border: Border(
                          //  bottom: BorderSide(width: 3, color: Colors.grey),
                          //),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => EditProfilePage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "• Setting",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      decoration: BoxDecoration(
                          //border: Border(
                          //  bottom: BorderSide(width: 3, color: Colors.grey),
                          //),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProfileUserPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "• Account",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MylistPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "• Help",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          //border: Border(
                          //  bottom: BorderSide(width: 3, color: Colors.grey),
                          //),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MylistPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "• Log out",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          //border: Border(
                          //  bottom: BorderSide(width: 3, color: Colors.grey),
                          //),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
