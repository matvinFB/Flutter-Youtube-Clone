import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class YoutubeApi{
  Future<dynamic> getVideos({
    String channelId = "",
    String order = "",
    String videoCategoryId = "",
    String q = "",
    String publishedAfter = "",
    String relatedToVideoId = ""}) async{


    //SharedPrefs sharedPrefs = SharedPrefs();
    //var dados = await sharedPrefs.recuperar();
    //return dados;

    //return Completer<String>().future;

    var stringBusca = BASE_URL+"search"+
        "?part=snippet"+
        "&type=video"+
        "&maxResults=10"+
        "&regionCode=NA"+
        "&key=$CHAVE_API";

    //Personalizando a busca
    q == "" ? stringBusca+="&order=relevance" : stringBusca+="&q=$q";
    channelId == "" ? stringBusca : stringBusca+="&channelId=$channelId";
    order == "" ? stringBusca+="&order=relevance" : stringBusca+="&order=$order";
    videoCategoryId == "" ? stringBusca : stringBusca+="&videoCategoryId=$videoCategoryId";
    relatedToVideoId == "" ? stringBusca : stringBusca+="&relatedToVideoId=$relatedToVideoId";

    try{
      http.Response response = await http.get(Uri.parse(stringBusca));

      if(response.statusCode == 200){
        return response.body;
      }
      print("Status code: ${response.statusCode}");
      return "";
    }catch(e){
      print(e);
      return "Err";
    }
  }
}

class SharedPrefs{

  salvar(dados)async{
    print("salvando...");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString ("tarefas", dados.runtimeType == String? dados : "");
    print("salvo");
    return;
  }

  recuperar()async{
    final prefs = await SharedPreferences.getInstance();
    var dados = await (prefs.getString("tarefas") ?? "[]");
    return dados;
  }

  remover()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("tarefas");
    return;
  }
}