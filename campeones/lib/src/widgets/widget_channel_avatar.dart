import 'package:campeones/src/models/channel.dart';
import 'package:campeones/src/models/textstyles.dart';
import 'package:flutter/material.dart';


class ChannelAvatar extends StatelessWidget {
    ChannelAvatar({required this.channel});
    final Channel channel;
    @override
    Widget build(BuildContext context) {
        return Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                    CircleAvatar(backgroundImage: channel.profilePicture, radius: 30,),
                    Text(channel.channelName, style: videoInfoStyle,)
                ],
            ),
        );
    }
}