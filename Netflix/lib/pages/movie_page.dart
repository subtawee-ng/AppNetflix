import 'package:flutter/material.dart';
import 'package:flutter_auth/json/home_json.dart';
import 'package:flutter_auth/pages/profile_page.dart';
import 'package:flutter_auth/json/mylist_json.dart';
import 'package:flutter_auth/pages/tvshows_page.dart';
import 'package:flutter_auth/pages/video_detail_page.dart';
import 'package:flutter_auth/pages/video_player_page.dart';

import 'mylist_page.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
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
        "Movie",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Image.asset("assets/images/test1.jpg",
              width: 26, height: 26, fit: BoxFit.cover),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Profile()));
          },
        )
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    int _value = 1;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      //ทำการเลื่อนได้
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/banner_1.webp"), //ใส่รูป banner หนัง
                            fit: BoxFit.cover,
                          )),
                    ),
                    //กล่องจัดการเกี่ยวกับความชัดของพื้นหลัง
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.85),
                            Colors.black.withOpacity(0),
                          ],
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    //ใส่ชื่อเรื่อง
                    Container(
                      height: 500,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/title_img_1.webp",
                            width: 300,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Exciting - Scifi - Drama - Scifi Adventure",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(height: 15),
                  Row(
                      //แถวปุ่มของหนัง
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //ทำปุ่ม my list
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 25,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "My List",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        //ทำกล่องปุ่ม play
                        //กดเพื่อเข้าหน้าเล่นรายละเอียดวิดีโอ
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => VideoPlayerPage(
                                    //videoUrl: "assets/videos/video_1.mp4",
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 13, left: 8, top: 2, bottom: 2),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Play",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => VideoDetailPage(
                                  videoUrl: "assets/videos/video_1.mp4",
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 25,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Info",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 40,
                  ),
                  //ทำแถบหนังแต่ละเรื่องข้างล่าง เช่น netflix
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text("Hit on Netflix",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        //แถบเรื่องของหนัง "Hit on netflix"
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                                children: List.generate(listHitNetflix.length,
                                    (index) {
                              return Container(
                                margin: EdgeInsets.only(right: 8),
                                width: 110,
                                height: 160,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => VideoDetailPage(
                                                videoUrl: listHitNetflix[index]
                                                    ["url"])));
                                  },
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        listHitNetflix[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              );
                            })),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text("Popular list",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        //แถบเรื่องของหนัง "popularList"
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                                children:
                                    List.generate(popularList.length, (index) {
                              return Container(
                                margin: EdgeInsets.only(right: 8),
                                width: 110,
                                height: 160,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => VideoDetailPage(
                                                videoUrl: popularList[index]
                                                    ["url"])));
                                  },
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                    image:
                                        AssetImage(popularList[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              );
                            })),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text("Training Now",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        //แถบเรื่องของหนัง "trendingList"
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                                children:
                                    List.generate(trendingList.length, (index) {
                              return Container(
                                margin: EdgeInsets.only(right: 8),
                                width: 110,
                                height: 160,
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => VideoDetailPage(
                                          videoUrl: trendingList[index]["url"],
                                        ),
                                      ),
                                    );
                                  },
                                  child: (Text(
                                    trendingList[index]["ranking"],
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                    image:
                                        AssetImage(trendingList[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              );
                            })),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text("Netflix Original",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        //แถบเรื่องของหนัง "originalList"
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: List.generate(
                                originalList.length,
                                (index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 8),
                                    width: 165,
                                    height: 300,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => VideoDetailPage(
                                              videoUrl: originalList[index]
                                                  ["url"],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            originalList[index]['img']),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ])
                ],
              ),
            ),
            //containner อีกกล่อง
            Container(
              child: SafeArea(
                child: Column(
                  children: [
                    //ปุ่มต่างๆ แถบข้างบน
                    SizedBox(height: 10), //จัดการช่องว่างข้างบน

                    SizedBox(
                      height: 15,
                    ),
                    //แถบเมนูชื่อ
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        (DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("First Item"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Second Item"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                  child: Text("Third Item"), value: 3),
                              DropdownMenuItem(
                                  child: Text("Fourth Item"), value: 4)
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            })),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => MoviePage()));
                          },
                          child: Text(
                            "Movies",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
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
