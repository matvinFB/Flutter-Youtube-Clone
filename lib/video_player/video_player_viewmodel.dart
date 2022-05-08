import 'package:mobx/mobx.dart';
import 'package:youtube_clone/common%20models/video.dart';
import 'package:youtube_clone/video_player/get_related_videos.dart';

part 'video_player_viewmodel.g.dart';

enum EstadosFetch {carregado, por_carregar}

class VideoPlayer_Viewmodel = _VideoPlayer_Viewlmodel
    with _$VideoPlayer_Viewmodel;

abstract class _VideoPlayer_Viewlmodel with Store {
  GetRelatedVideos getRelatedVideos = GetRelatedVideos();

  @observable
  List<Video> videos = [];

  @observable
  EstadosFetch estado = EstadosFetch.por_carregar;

  @action
  _setVideos(List<Video> val) {
    videos.addAll(val);
    return;
  }

  @action
  fetchRelatedVideos({String relatedToVideoId = ""}) async {
    try {
      _setVideos(await getRelatedVideos.getListVideos(
          relatedToVideoId: relatedToVideoId));
    } catch (e) {
      print("Lista de relacionados zerada");
    }
    estado = EstadosFetch.carregado;
  }
}
