import 'package:flutter/material.dart';
import 'package:youtube_clone/logic/services/api.dart';
import 'package:youtube_clone/views/utils/constants.dart';

import '../utils/video_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var index_bottom_nav = 0 ;
  var youtube = api_conection();
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
        child: FutureBuilder(
          future: youtube.get_videos(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Text('aguardando');
            }else if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
              return video_list(snapshot.data);
              //
            }
            print(snapshot.hasData);
            return Text('erro');
          }
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
        items: [
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
