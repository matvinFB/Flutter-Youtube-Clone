import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:youtube_clone/home/home_viewmodel.dart';
import 'package:youtube_clone/utils/constants.dart';

import 'biblioteca_widget.dart';
import 'video_list_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var index_bottom_nav = 0;
  Home_Viewmodel homeVM = Home_Viewmodel();
  ReactionDisposer? reactionDisposer;

  @override
  void initState() {
    homeVM.fetchVideos();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    reactionDisposer = reaction((_)=>homeVM.index, (val){index_bottom_nav = homeVM.getIndex();});
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    reactionDisposer!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/youtube.png',
            height: 20,
          ),
          backgroundColor: COLOR_BACK,
          actions: [
            IconButton(
                color: COLOR_DETAILS,
                onPressed: () {
                  print("Cast");
                },
                icon: Icon(Icons.cast)),
            IconButton(
                color: COLOR_DETAILS,
                onPressed: () {
                  print("Notification");
                },
                icon: Icon(Icons.notifications_none)),
            IconButton(
                color: COLOR_DETAILS,
                onPressed: () {
                  print("Search");
                },
                icon: Icon(Icons.search)),
            IconButton(
                color: COLOR_DETAILS,
                onPressed: () {
                  print("Account");
                },
                icon: Icon(Icons.account_circle))
          ],
        ),
        body: Container(
          child: Observer(
            builder: (_) {
              switch(homeVM.index){
                case 0:{
                  return VideoListWidget(homeVM.videos);
                }break;
                case 1:{
                  return VideoListWidget(homeVM.videos);
                }break;
                case 2:{
                  return Container(
                    alignment: Alignment.center,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[Text(
                        "Página ainda não implementada.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15
                        ),
                      )]
                  )
                  );
                }break;
                case 3:{
                  return VideoListWidget(homeVM.videos);
                }break;
                case 4:{
                  return BibliotecaWidget(homeVM.videos);
                }break;
                default: {
                  return VideoListWidget(homeVM.videos);
                }

              }

            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: COLOR_SELECT,
          backgroundColor: COLOR_BACK,
          currentIndex: index_bottom_nav,
          onTap: (index) {
            homeVM.setIndex(index);
            switch (index) {
              case 0:
                {homeVM.fetchVideos(
                  videoCategoryId: "27"
                );}
                break;
              case 1:
                DateTime lastWeekDate = DateTime.now().subtract(const Duration(days:7));
                {homeVM.fetchVideos(
                  order: "viewCount",
                  publishedAfter: lastWeekDate.toUtc().toString().replaceAll(RegExp('.[0-9]*Z'), 'Z').replaceAll(' ', 'T'),
                );}
                break;
              case 2:
                {}
                break;
              case 3:
                {homeVM.fetchVideos(
                    relatedToVideoId: "WgadnZcujuc",
                    order: "date"
                );
                }
                break;
              case 4:
                {
                  homeVM.fetchVideos(
                      relatedToVideoId: "UpMJOf8jj8k",
                      order: "viewCount"
                  );
                }
                break;
              default:
                {}
                break;
            }

            setState(() {
              index_bottom_nav = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
                backgroundColor: COLOR_DETAILS),
            BottomNavigationBarItem(
              label: 'Em Alta',
              icon: Icon(Icons.local_fire_department),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.add_circle,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Inscrições',
              icon: Icon(Icons.subscriptions),
            ),
            BottomNavigationBarItem(
              label: 'Biblioteca',
              icon: Icon(Icons.video_library),
            ),
          ],
        ));
  }
}
