import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class api_conection{
  Future get_videos([String id_canal = ""]) async{
    //return null;
    var string_busca = BASE_URL+"search"+
        "?part=snippet"+
        "&type=video"+
        "&maxResults=10"+
        "&order=relevance"+
        "&regionCode=NA"+
        "&videoCategoryId=27"+
        "&key=$CHAVE_API";

    id_canal == "" ? string_busca : string_busca+="&channelId=$id_canal";
    print(string_busca);
    http.Response response = await http.get(Uri.parse(string_busca));

    //print(response.body);
    print(response.statusCode);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;

  }
}