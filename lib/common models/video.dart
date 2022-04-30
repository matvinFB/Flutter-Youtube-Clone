
class Video{
  var _id;
  var _title;
  var _canal;
  var _thumbnail_link;

  Video(this._id, this._title, this._canal, this._thumbnail_link);

  @override
  String toString() {
    return 'Video{_id: $_id, _title: $_title, _thumbnail_link: $_thumbnail_link, _canal: $_canal}';
  }

  get canal => _canal;

  get thumbnail_link => _thumbnail_link;

  get title => _title;

  get id => _id;
}