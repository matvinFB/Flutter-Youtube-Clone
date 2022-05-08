// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_player_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoPlayer_Viewmodel on _VideoPlayer_Viewlmodel, Store {
  late final _$videosAtom =
      Atom(name: '_VideoPlayer_Viewlmodel.videos', context: context);

  @override
  List<Video> get videos {
    _$videosAtom.reportRead();
    return super.videos;
  }

  @override
  set videos(List<Video> value) {
    _$videosAtom.reportWrite(value, super.videos, () {
      super.videos = value;
    });
  }

  late final _$estadoAtom =
      Atom(name: '_VideoPlayer_Viewlmodel.estado', context: context);

  @override
  EstadosFetch get estado {
    _$estadoAtom.reportRead();
    return super.estado;
  }

  @override
  set estado(EstadosFetch value) {
    _$estadoAtom.reportWrite(value, super.estado, () {
      super.estado = value;
    });
  }

  late final _$fetchRelatedVideosAsyncAction = AsyncAction(
      '_VideoPlayer_Viewlmodel.fetchRelatedVideos',
      context: context);

  @override
  Future fetchRelatedVideos({String relatedToVideoId = ""}) {
    return _$fetchRelatedVideosAsyncAction.run(
        () => super.fetchRelatedVideos(relatedToVideoId: relatedToVideoId));
  }

  late final _$_VideoPlayer_ViewlmodelActionController =
      ActionController(name: '_VideoPlayer_Viewlmodel', context: context);

  @override
  dynamic _setVideos(List<Video> val) {
    final _$actionInfo = _$_VideoPlayer_ViewlmodelActionController.startAction(
        name: '_VideoPlayer_Viewlmodel._setVideos');
    try {
      return super._setVideos(val);
    } finally {
      _$_VideoPlayer_ViewlmodelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
videos: ${videos},
estado: ${estado}
    ''';
  }
}
