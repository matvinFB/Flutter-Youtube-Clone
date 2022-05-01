import 'package:flutter/material.dart';

import '../common models/video.dart';
import '../utils/constants.dart';

class BibliotecaWidget extends StatefulWidget {
  List<Video> videos = [];


  BibliotecaWidget([this.videos = const <Video>[]]);

  @override
  State<BibliotecaWidget> createState() => _BibliotecaWidgetState();
}

class _BibliotecaWidgetState extends State<BibliotecaWidget> {
  @override
  Widget build(BuildContext context) {
    var videos = widget.videos;
    return ListView(
      children: [
        SizedBox(height: 10,),
        Padding(
            padding: PADDINGS_DEFAULT,
          child: Text(
            "Recentes",
            style: TextStyle(
                fontSize: 18,
                color: COLOR_TEXT,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 148,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videos.length,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(right: 5),
                child: SizedBox(
                  width: (18*60/9),
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
                        SizedBox(height: 3),
                        Text(
                          videos[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: 3),
                        Text(
                          videos[index].canal,
                          maxLines: 1,

                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 10,
                              color: COLOR_DETAILS
                          ),
                        )
                      ],
                    ),
                    onTap: (){
                      print(index);
                    },
                  ),
                ),
              );
            },


          ),
        ),
        Divider(
          height: 1,
          thickness: 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15,),
            Container(
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    child: Icon(
                      Icons.history,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      child: Text(
                        "Histórico",
                        style: TextStyle(
                            fontSize: 16,
                            color: COLOR_TEXT,
                            fontWeight: FontWeight.w400
                        ),
                      )
                  )

                ],
              ),
            ),

            SizedBox(height: 23,),
            Container(
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    child: Icon(
                      Icons.play_arrow,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      child: Text(
                        "Seus vídeos",
                        style: TextStyle(
                            fontSize: 16,
                            color: COLOR_TEXT,
                            fontWeight: FontWeight.w400
                        ),
                      )
                  )

                ],
              ),
            ),

            SizedBox(height: 23,),
            Container(
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    child: Icon(
                      Icons.arrow_downward,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      child: Text(
                        "Downloads",
                        style: TextStyle(
                            fontSize: 16,
                            color: COLOR_TEXT,
                            fontWeight: FontWeight.w400
                        ),
                      )
                  ),
                  Container(
                    width: 60,
                    child: Icon(
                      Icons.check_circle,
                      size: 22,
                      color: Colors.black,
                    ),
                  )

                ],
              ),
            ),

            SizedBox(height: 23,),
            Container(
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    child: Icon(
                      Icons.local_movies_outlined,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      child: Text(
                        "Seus filmes",
                        style: TextStyle(
                            fontSize: 16,
                            color: COLOR_TEXT,
                            fontWeight: FontWeight.w400
                        ),
                      )
                  )

                ],
              ),
            ),

            SizedBox(height: 23,),
            Container(
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    child: Icon(
                      Icons.history,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      child: Text(
                        "Histórico",
                        style: TextStyle(
                            fontSize: 16,
                            color: COLOR_TEXT,
                            fontWeight: FontWeight.w400
                        ),
                      )
                  )

                ],
              ),
            ),

            SizedBox(height: 23,),
            Container(
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    child: Icon(
                      Icons.access_time,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      child: Text(
                        "Assistir mais tarde",
                        style: TextStyle(
                            fontSize: 16,
                            color: COLOR_TEXT,
                            fontWeight: FontWeight.w400
                        ),
                      )
                  )

                ],
              ),
            ),

            SizedBox(height: 23,),
            Container(
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    child: Icon(
                      Icons.content_cut,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      child: Text(
                        "Seus Clipes",
                        style: TextStyle(
                            fontSize: 16,
                            color: COLOR_TEXT,
                            fontWeight: FontWeight.w400
                        ),
                      )
                  )

                ],
              ),
            ),

            SizedBox(height: 15,)
          ],
        ),
        Divider(
          height: 1,
          thickness: 2,
        ),
        SizedBox(height: 23,),
        Padding(
            padding: PADDINGS_DEFAULT,
          child: Row(
            children: [
              Expanded(
                  child: Text(
                    "Playlists",
                    style: TextStyle(
                        fontSize: 18,
                        color: COLOR_TEXT,
                        fontWeight: FontWeight.w400
                    ),
                  )
              ),
              Container(
                child: Text("Adicionados recentemente"),
              ),
              Container(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                  size: 18,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 23,),
        Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ),
                  Text(
                    "Nova playlist",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 23,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                  Text(
                    "Vídeos marcados como gostei",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

