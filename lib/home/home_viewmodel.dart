import 'package:mobx/mobx.dart';
import 'package:youtube_clone/common%20models/video.dart';
import 'get_list_videos.dart';
part 'home_viewmodel.g.dart';

enum EstadosFetch {carregado, carregando, erro}

class Home_Viewmodel = _Home_Viewlmodel with _$Home_Viewmodel;

abstract class _Home_Viewlmodel with Store{
  GetListVideos getVideos = GetListVideos();

  @observable
  List<Video> videos= [];

  @observable
  int index = 0;

  @observable
  EstadosFetch state = EstadosFetch.carregado;

  @action
  _setVideos(List<Video> val) => videos = val;

  @action
  int getIndex() => index;

  @action
  void setIndex(int val) => index = val;

  @action
  EstadosFetch getState() => state;

  @action
  void _setState(EstadosFetch val) => state = val;

  @action
  fetchVideos({
    String channelId = "",
    String order = "",
    String videoCategoryId = "",
    String q = "",
    String publishedAfter = "",
    String relatedToVideoId = ""}) async{

    _setState(EstadosFetch.carregando);
    publishedAfter.replaceAll(' ', 'T');

    try {
      _setVideos(
          await getVideos.getListVideos(
              channelId: channelId,
              order: order,
              videoCategoryId: videoCategoryId,
              q: q,
              publishedAfter: publishedAfter,
              relatedToVideoId: relatedToVideoId
          )
      );
    }catch(e){
      _setState(EstadosFetch.erro);
    }

    _setState(EstadosFetch.carregado);
  }

}