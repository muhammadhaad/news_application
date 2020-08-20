class NewsData {
  int _articleId;
  String _imageUrl;
  String _heading;
  String _description;
  String _date;
  String _category;
  //String _authorID;
  int _likes;
  bool _like;

  NewsData(
    this._articleId,
    this._imageUrl,
    this._heading,
    this._description,
    this._date,
    this._category,
    //this._authorID,
    this._likes,
    this._like,
  );

  //setters

  set articleId(int artId) {
    this._articleId = artId;
  }

  set imageUrl(String imageUrl) {
    this._imageUrl = imageUrl;
  }

  set heading(String heading) {
    this._heading = heading;
  }

  set description(String description) {
    this._description = description;
  }

  set date(String date) {
    this._date = date;
  }

  set category(String category) {
    this._category = category;
  }

  /*set author(String author) {
    this._authorID = author;
  }*/

  set likes(int likes) {
    this._likes = likes;
  }

  set like(bool like) {
    this._like = like;
  }

  //getters

  int get articleId => this._articleId;

  String get imageUrl => this._imageUrl;

  String get heading => this._heading;

  String get description => this._description;

  String get date => this._date;

  String get category => this._category;

  //String get author => this._authorID;

  int get likes => this._likes;

  bool get like => this._like;
}
