// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Home_Viewmodel on _Home_Viewlmodel, Store {
  late final _$videosAtom =
      Atom(name: '_Home_Viewlmodel.videos', context: context);

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

  late final _$indexAtom =
      Atom(name: '_Home_Viewlmodel.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$fetchVideosAsyncAction =
      AsyncAction('_Home_Viewlmodel.fetchVideos', context: context);

  @override
  Future fetchVideos(
      {String channelId = "",
      String order = "",
      String videoCategoryId = "",
      String q = "",
      String publishedAfter = ""}) {
    return _$fetchVideosAsyncAction.run(() => super.fetchVideos(
        channelId: channelId,
        order: order,
        videoCategoryId: videoCategoryId,
        q: q,
        publishedAfter: publishedAfter));
  }

  late final _$_Home_ViewlmodelActionController =
      ActionController(name: '_Home_Viewlmodel', context: context);

  @override
  dynamic _setVideos(List<Video> val) {
    final _$actionInfo = _$_Home_ViewlmodelActionController.startAction(
        name: '_Home_Viewlmodel._setVideos');
    try {
      return super._setVideos(val);
    } finally {
      _$_Home_ViewlmodelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
videos: ${videos},
index: ${index}
    ''';
  }
}
