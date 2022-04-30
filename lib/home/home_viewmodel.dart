import 'package:mobx/mobx.dart';
import 'package:youtube_clone/common%20models/video.dart';
import 'get_list_videos.dart';
part 'home_viewmodel.g.dart';



class Home_Viewmodel = _Home_Viewlmodel with _$Home_Viewmodel;

abstract class _Home_Viewlmodel with Store{
  GetListVideos getVideos = GetListVideos();
  @observable
  List<Video> videos= [];

  @observable
  int index = 0;

  @action
  _setVideos(List<Video> val) => videos = val;

  @action
  fetchVideos({
    String channelId = "",
    String order = "",
    String videoCategoryId = "",
    String q = "",
    String publishedAfter = ""}) async{
    _setVideos(
      await getVideos.getListVideos(
          channelId:channelId,
          order: order,
          videoCategoryId: videoCategoryId,
          q:q,
          publishedAfter: publishedAfter
      )
    );
  }


}