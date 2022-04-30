import 'dart:async';

import 'package:http/http.dart' as http;

import 'constants.dart';

class YoutubeApi{

  Future<String> getVideos({
    String channelId = "",
    String order = "",
    String videoCategoryId = "",
    String q = "",
    String publishedAfter = ""}) async{

    //return Completer<String>().future;

    var stringBusca = BASE_URL+"search"+
        "?part=snippet"+
        "&type=video"+
        "&maxResults=10"+
        "&regionCode=NA"+
        "&videoCategoryId=27"+
        "&key=$CHAVE_API";

    //Personalizando a busca
    q == "" ? stringBusca+="&order=relevance" : stringBusca+="&q=$q";
    channelId == "" ? stringBusca : stringBusca+="&channelId=$channelId";
    order == "" ? stringBusca+="&order=relevance" : stringBusca+="&order=$order";
    videoCategoryId == "" ? stringBusca : stringBusca+="&videoCategoryId=$videoCategoryId";

    try{
      http.Response response = await http.get(Uri.parse(stringBusca));
      if(response.statusCode == 200){
        return response.body;
      }
      return "";
    }catch(e){
      return "";
    }
  }
}