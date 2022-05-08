import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:youtube_clone/utils/constants.dart';
import 'package:youtube_clone/video_player/video_player_viewmodel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../common models/video.dart';

class videoPlayer extends StatefulWidget {
  static const String routeName = '/Player';

  Video? video;

  videoPlayer({required this.video, Key? key}) : super(key: key);

  @override
  State<videoPlayer> createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {
  YoutubePlayerController? _controller;
  VideoPlayer_Viewmodel videoPlayerVM = VideoPlayer_Viewmodel();
  Video? video;
  List<Video> videos = [];

  @override
  void initState() {
    video = widget.video;
    videoPlayerVM.fetchRelatedVideos(relatedToVideoId: video?.id);
    _controller = YoutubePlayerController(
      initialVideoId: video!.id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        controlsVisibleAtStart: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white10,
        child: Column(
          children: [
            YoutubePlayer(
              controller: _controller!,
              showVideoProgressIndicator: true,
              progressIndicatorColor: COLOR_SELECT,
              progressColors: const ProgressBarColors(
                playedColor: Colors.grey,
                handleColor: COLOR_SELECT,
              ),
            ),
            SizedBox(height: 7,),
            Column(
              children: [
            Container(
              padding: PADDINGS_DEFAULT,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        video!.title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 20,
                    child: Icon(Icons.keyboard_arrow_down),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 12,
            ),

            //Icones (Gostei, Não Gostei...)
            Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 90,
                      child: Column(
                        children: [Icon(Icons.thumb_up), Text("Gostei")],
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Column(
                        children: [
                          Icon(Icons.thumb_down),
                          Text("Não Gostei")
                        ],
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Column(
                        children: [Icon(Icons.share), Text("Compartilhar")],
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Column(
                        children: [Icon(Icons.add), Text("Criar")],
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Column(
                        children: [
                          Icon(Icons.arrow_downward),
                          Text("Download")
                        ],
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Column(
                        children: [
                          Icon(Icons.playlist_add),
                          Text("Salvar")
                        ],
                      ),
                    ),
                  ],
                )),

            SizedBox(
              height: 15,
            ),

            Divider(
              thickness: 1,
              height: 3,
              color: Colors.grey,
            ),

            //Dados do canal
            Container(
              padding: PADDINGS_DEFAULT,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(
                      Icons.person_pin,
                      size: 35,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: PADDINGS_DEFAULT,
                      child: Text(
                        video!.canal,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      child: Text(
                        'INSCREVER-SE',
                        style: TextStyle(color: COLOR_SELECT),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),

            Divider(
              thickness: 1,
              height: 3,
              color: Colors.grey,
            ),

            SizedBox(
              height: 15,
            ),


              ],
            ),
            Observer(
              builder: (BuildContext context) {
                if (videoPlayerVM.estado == EstadosFetch.por_carregar) {
                  return const Text("Carregando");
                } else {
                  videoPlayerVM.videos == null
                      ? print("Nulo")
                      : print("Não nulo");
                  videos = videoPlayerVM.videos.toList();
                  return Expanded(
                    child: ListView.builder(
                        itemCount: videos.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/Player', arguments: videos[index]);
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              alignment:
                                              FractionalOffset.center,
                                              image: NetworkImage(
                                                (videos[index].thumbnail_link),
                                              ))),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      const SizedBox(
                                          width: 40,
                                          child: Icon(Icons.person_pin, size: 30,)),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              videos[index].title,
                                              softWrap: true,
                                              maxLines: 2,
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              videos[index].canal,
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: COLOR_DETAILS),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                        child: Icon(Icons.more_vert),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Divider(
                                    thickness: 4,
                                    height: 1,
                                  ),
                                ]),
                          );
                        }),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
