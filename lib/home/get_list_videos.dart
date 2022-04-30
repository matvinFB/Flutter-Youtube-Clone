import 'dart:convert';

import '../common models/video.dart';
import '../services/youtube_api.dart';


class GetListVideos{

  YoutubeApi youtube = YoutubeApi();

  Future<List<Video>> getListVideos({
    String channelId = "",
    String order = "",
    String videoCategoryId = "",
    String q = "",
    String publishedAfter = ""}) async{

    List<Video> videos = [];
    try {
      List<dynamic>videosMap = json.decode(await youtube.getVideos(
          channelId:channelId,
          order: order,
          videoCategoryId: videoCategoryId,
          q:q,
          publishedAfter: publishedAfter
      ))["items"];
      for (var i in videosMap){
        var snip = i["snippet"];
        Video video = Video(i["id"]["videoId"], snip["title"],
            snip["channelTitle"], snip["thumbnails"]["high"]["url"]);
        videos.add(video);
      }
    }catch(e){
      print("Deu erro!");
    }



    return videos;
  }
}