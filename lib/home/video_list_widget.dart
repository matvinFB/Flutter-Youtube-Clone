import 'package:flutter/material.dart';
import 'package:youtube_clone/common%20models/video.dart';
import 'package:youtube_clone/utils/constants.dart';

class VideoListWidget extends StatefulWidget {
  List<Video> videos = [];

  VideoListWidget([this.videos = const <Video>[]]);

  @override
  State<VideoListWidget> createState() => _VideoListWidgetState();
}

class _VideoListWidgetState extends State<VideoListWidget> {
  @override
  Widget build(BuildContext context) {
    var videos = widget.videos;

    return ListView.builder(

        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
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
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                        ),
                      ),
                      Text(
                          videos[index].canal,
                          style: const TextStyle(
                            fontSize: 10,
                          )
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/Player', arguments: videos[index]);
                  },
                )),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          );
        });
  }
}
