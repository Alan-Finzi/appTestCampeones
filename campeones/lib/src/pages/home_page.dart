import 'package:campeones/src/models/channel.dart';
import 'package:campeones/src/models/colors.dart';
import 'package:campeones/src/models/textstyles.dart';
import 'package:campeones/src/models/video.dart';
import 'package:campeones/src/widgets/widget_channel_avatar.dart';
import 'package:campeones/src/widgets/widget_video_card.dart';
import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {
    static final String routeName = 'home_page';

    Widget build(BuildContext context) {
        return  Scaffold(
            resizeToAvoidBottomInset: false,
            body: _bodyChild(context)
        );
    }


    Widget _bodyChild(BuildContext context){
        return  DefaultTabController(
            length: 5,
            child: new Scaffold(
                appBar: AppBar(
                    actions: <Widget>[
                        Container(
                            child: Row(children: <Widget>[
                                SizedBox(width: 50,),
                                Text("Cruces de Campeones",),
                            ],),),
                        Container(
                            padding: EdgeInsets.only(left: 30, bottom: 15,right: 30),
                            child: Container(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                        Icon(Icons.cast),
                                        Icon(Icons.video_call),
                                        Icon(Icons.search),
                                    ],
                                ),
                            )
                        ),
                    ],
                    backgroundColor: tabBarColor,
                ),
                body: TabBarView(
                    children: [
                        new Container(
                            color: backgroundColor,
                            child: ListView(children: getVideos(false),),
                        ),
                        new Container(color: Colors.orange,),
                        new Container(
                            color: backgroundColor,
                            child: ListView(children: getVideos(true),),
                        ),
                        new Container(
                            color: Colors.red,
                        ),
                        new Container(
                            color: Colors.blue,
                        ),
                    ],
                ),
                bottomNavigationBar: new TabBar(
                    labelStyle: tabTextStyle,
                    tabs: tabList,
                    labelColor: tabBarSelectedIconsColor,
                    unselectedLabelColor: tabBarUnselectedIconsColor,
                    indicatorColor: Colors.transparent,
                ),
                backgroundColor: tabBarColor,
            ),
        );
    }
    Channel channel = new Channel("Cruce de campeones", AssetImage("campones2.jpg"));
    List<String> videoTitles = [
        "titulo 1",
        "titulo 2",
        "titulo 3",
        "titulo 4",
        "titulo 5"
    ];
    List<Widget> getVideos(bool isSubscriptionPage) {
        List<Video> videos = makeVideos();
        List<Widget> cards = [];
        if (isSubscriptionPage) {
            cards.add(Container(
                color: backgroundColor, height: 140,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                        Row(
                            children: <Widget>[
                                ChannelAvatar(channel: channel),
                            ]
                        ),
                        Divider(color: tabBarUnselectedIconsColor,),
                    ],
                ),
            )
            );
        } else {
            cards.add(Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                color: backgroundColor, height: 50,
            )
            );
        }
        for (Video video in videos) {
            cards.add(VideoCard(video: video,));
        }
        return cards;
    }


    List<Video> makeVideos() {
        List<Video> vids = [];
        for (int i = 1; i < 5; i++) {
            vids.add(new Video(
               channel: channel,
                thumbnail: AssetImage( i.toString() + ".png"),
               uploadDate:   DateTime.now().subtract(new Duration(days: 400)),
                videoTitle:  videoTitles[i],
                viewCount: 120000,
            ));
        }
        return vids;
    }

    List<Widget> tabList = [
        Tab(
            icon: new Icon(Icons.home),
            text: "Home",
        ),
        Tab(
            icon: new Icon(Icons.explore),
            text: "Explore",
        ),
        Tab(
            icon: new Icon(Icons.subscriptions),
            text: "Subscriptions",
        ),
        Tab(
            icon: new Icon(Icons.email),
            text: "Inbox",
        ),
        Tab(
            icon: new Icon(Icons.video_library),
            text: "Library",
        )
    ];
}


