import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:youtube_clone/home/home_viewmodel.dart';
import 'package:youtube_clone/utils/constants.dart';

import '../common widgets/video_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var index_bottom_nav = 0 ;
  Home_Viewmodel homeVM = Home_Viewmodel();

  @override
  void initState() {
    homeVM.fetchVideos();
    super.initState();
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
              onPressed: (){
                print("Cast");
              },
              icon: Icon(
                Icons.cast
              )
          ),
          IconButton(
              color: COLOR_DETAILS,
              onPressed: (){
                print("Notification");
              },
              icon: Icon(
                  Icons.notifications_none
              )
          ),
          IconButton(
              color: COLOR_DETAILS,
              onPressed: (){
                print("Search");
              },
              icon: Icon(
                  Icons.search
              )
          ),
          IconButton(
              color: COLOR_DETAILS,
              onPressed: (){
                print("Account");
              },
              icon: Icon(
                  Icons.account_circle
              )
          )
        ],
      ),
      body: Container(
        child: Observer(
          builder: (_){
            return VideoListWidget(homeVM.videos);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: COLOR_SELECT,
        backgroundColor: COLOR_BACK,
        currentIndex: index_bottom_nav,
        onTap: (index){
          setState(() {
            index_bottom_nav = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
              backgroundColor: COLOR_DETAILS
          ),
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
      )
    );
  }
}
