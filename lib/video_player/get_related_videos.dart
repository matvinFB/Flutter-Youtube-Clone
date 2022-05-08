import 'dart:convert';

import '../common models/video.dart';
import '../services/youtube_api.dart';

class GetRelatedVideos {
  YoutubeApi youtube = YoutubeApi();

  Future<List<Video>> getListVideos({String relatedToVideoId = ""}) async {
    List<Video> videos = [];
    try {
      List<dynamic> videosMap = json.decode(
          await youtube.getVideos(relatedToVideoId: relatedToVideoId))["items"];
      for (var i in videosMap) {
        var snip = i["snippet"];
        try {
          Video video = Video(i["id"]["videoId"], snip["title"],
              snip["channelTitle"], snip["thumbnails"]["high"]["url"]);
          videos.add(video);
        } catch (e) {
          print("Erro na conversão para model!!!");
        }
      }
    } catch (e) {
      print(e.toString());
      print("Deu erro!");
    }

    return videos;
  }
}
