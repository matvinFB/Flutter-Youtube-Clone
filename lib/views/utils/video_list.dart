import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/logic/video.dart';
import 'package:youtube_clone/views/utils/constants.dart';

class video_list extends StatefulWidget {
  var videos;

  video_list(videos) {
    this.videos = json_to_video(json.decode(videos)["items"]);
  }

  List<Video> json_to_video(data) {
    var temp = <Video>[];
    for (var i in data) {
      var snip = i["snippet"];
      Video video = Video(i["id"]["videoId"], snip["title"],
          snip["channelTitle"], snip["thumbnails"]["high"]["url"]);
      temp.add(video);
    }
    return temp;
  }

  @override
  State<video_list> createState() => _video_listState();
}

class _video_listState extends State<video_list> {
  @override
  Widget build(BuildContext context) {
    var videos = widget.videos;
    return ListView.builder(
        itemCount: widget.videos.length,
        itemBuilder: (context, index) {
          print(videos[index].thumbnail_link);
          return Padding(
            padding: EdgeInsets.only(top: 20),
            child: Wrap(
              children: [
                Container(
                  color: COLOR_BACK_DETAIL,
                    child: GestureDetector(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 16/9,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              alignment: FractionalOffset.center,
                              image: NetworkImage(
                                (videos[index].thumbnail_link),
                              )
                            )
                          ),
                        ),
                      ),
                      Text(
                          videos[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                        ),
                      ),
                      Text(
                          videos[index].canal,
                          style: TextStyle(
                            fontSize: 10,
                          )
                      )
                    ],
                  ),
                  onTap: () {
                    print(index);
                  },
                )),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          );
        });
  }
}
